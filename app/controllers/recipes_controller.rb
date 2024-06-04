class RecipesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_timetable
    before_action :set_recipe, only: [:edit, :update, :destroy]
  
    def new
      @recipe = @timetable.recipes.build(meal_type: params[:meal_type])
    end
  
    def create
      @recipe = @timetable.recipes.build(recipe_params)
      @recipe.user = current_user
      if @recipe.save
        redirect_to @timetable, notice: 'Recipe was successfully added.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @recipe.update(recipe_params)
        redirect_to @timetable, notice: 'Recipe was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @recipe.destroy
      redirect_to @timetable, notice: 'Recipe was successfully deleted.'
    end
  
    private
  
    def set_timetable
      @timetable = Timetable.find(params[:timetable_id])
    end
  
    def set_recipe
      @recipe = @timetable.recipes.find(params[:id])
    end
  
    def recipe_params
      params.require(:recipe).permit(:ingredients, :steps)
    end
  end
  