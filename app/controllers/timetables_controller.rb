class TimetablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

  def index
    @timetables = current_user.timetables
  end
  def show
    @timetable = Timetable.find(params[:id])
    if @timetable.time_range_type == "month"
      # Set start_date and end_date based on the current month if they are nil
      @timetable.start_date ||= Date.today.beginning_of_month
      @timetable.end_date ||= Date.today.end_of_month
    end
  end
  
  def new
    @timetable = Timetable.new
    set_initial_dates
    build_recipes_for_duration
  end

  def create
    @timetable = current_user.timetables.build(timetable_params)
    set_dates_based_on_time_range
    set_user_for_recipes

    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully created.'
    else
      set_initial_dates
      build_recipes_for_duration
      render :new
    end
  end

  def edit
    build_recipes_for_duration
  end

  def update
    @timetable.assign_attributes(timetable_params)
    set_dates_based_on_time_range
    set_user_for_recipes

    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully updated.'
    else
      build_recipes_for_duration
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

  def set_user_for_recipes
    @timetable.recipes.each { |recipe| recipe.user = current_user }
  end

  def timetable_params
    params.require(:timetable).permit(
      :time_range_type,
      :start_date,
      :end_date,
      recipes_attributes: [:id, :meal_type, :meal_name, :ingredients, :steps, :_destroy]
    )
  end

  def set_initial_dates
    @start_date = Date.today.beginning_of_week
    @end_date = @start_date.end_of_week
    @timetable.start_date ||= @start_date
    @timetable.end_date ||= @end_date
  end

  def set_dates_based_on_time_range
    case @timetable.time_range_type
    when 'month'
      set_month_dates(params[:timetable][:month])
    when 'week'
      set_week_dates(params[:timetable][:week])
    when 'custom'
      set_custom_dates(params[:timetable][:start_date], params[:timetable][:end_date])
    end
  end

  def set_month_dates(month_param)
    return unless month_param.present?
  
    if month_param =~ /\A\d{4}-\d{2}\z/
      begin
        month = Date.parse(month_param)
        @timetable.start_date = month.beginning_of_month
        @timetable.end_date = month.end_of_month
      rescue ArgumentError => e # Catch the ArgumentError and handle it gracefully
        flash[:alert] = "Invalid date format for month: #{e.message}"
      end
    else
      flash[:alert] = 'Invalid date format for month. Please use YYYY-MM.'
    end
  end
  
  

  def set_week_dates(week_param)
    return unless week_param.present?

    week = Date.parse(week_param)
    @timetable.start_date = week.beginning_of_week
    @timetable.end_date = week.end_of_week
  end

  def set_custom_dates(start_date_param, end_date_param)
    return unless start_date_param.present? && end_date_param.present?

    @timetable.start_date = Date.parse(start_date_param)
    @timetable.end_date = Date.parse(end_date_param)
  end

  def build_recipes_for_duration
    case @timetable.time_range_type
    when 'month'
      build_recipes_for_repeated_weeks(@timetable.start_date, @timetable.end_date)
    when 'week', 'custom'
      build_recipes(@timetable.start_date, @timetable.end_date)
    end
  end

  def build_recipes(start_date, end_date)
    (start_date..end_date).each do |date|
      %w[breakfast lunch dinner].each do |meal|
        meal_type = "#{date.strftime('%A').downcase}_#{meal}"
        @timetable.recipes.find_or_initialize_by(meal_type: meal_type).tap do |recipe|
          recipe.timetable_id = @timetable.id
          recipe.user_id = current_user.id
        end
      end
    end
  end
end
