class TimetablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

  def index
    @timetables = current_user.timetables
  end

  def show
  end

  def new
    @timetable_type = params[:timetable_type]
    @start_date = params[:start_date]&.to_date || Date.today.beginning_of_week
    @end_date = params[:end_date]&.to_date || @start_date.end_of_week

    @timetable = Timetable.new(week_start_date: @start_date, end_date: @end_date)
    build_recipes_for_week if @start_date && @end_date
  end

  def create
    @timetable = current_user.timetables.build(timetable_params)
    set_user_for_recipes

    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully created.'
    else
      build_recipes_for_week
      render :new
    end
  end

  def edit
    build_recipes_for_week
  end

  def update
    @timetable.assign_attributes(timetable_params)
    set_user_for_recipes

    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully updated.'
    else
      build_recipes_for_week
      render :edit
    end
  end

  def destroy
    @timetable.destroy
    redirect_to timetables_url, notice: 'Timetable was successfully deleted.'
  end

  private

  def set_timetable
    @timetable = Timetable.find(params[:id])
  end

  def timetable_params
    params.require(:timetable).permit(
      :week_start_date,
      :start_date, :end_date,
      :monday_breakfast, :monday_lunch, :monday_dinner,
      :tuesday_breakfast, :tuesday_lunch, :tuesday_dinner,
      :wednesday_breakfast, :wednesday_lunch, :wednesday_dinner,
      :thursday_breakfast, :thursday_lunch, :thursday_dinner,
      :friday_breakfast, :friday_lunch, :friday_dinner,
      :saturday_breakfast, :saturday_lunch, :saturday_dinner,
      :sunday_breakfast, :sunday_lunch, :sunday_dinner,
      recipes_attributes: [:id, :meal_type, :ingredients, :steps, :_destroy]
    )
  end

  def build_recipes_for_week
    return if @timetable.start_date.nil? || @timetable.end_date.nil?

    (@timetable.start_date..@timetable.end_date).each do |date|
      day = date.strftime("%A").downcase
      %w[breakfast lunch dinner].each do |meal|
        meal_type = "#{day}_#{meal}"
        @timetable.recipes.build(meal_type: meal_type) unless @timetable.recipes.exists?(meal_type: meal_type)
      end
    end
  end

  def set_user_for_recipes
    @timetable.recipes.each { |recipe| recipe.user = current_user }
  end
end
