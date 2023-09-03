class RecipesController < ApplicationController
    before_action :require_login

    def index
      recipes = Recipe.all  
      render json: recipes, include: :user
    end
  
    def create 
        recipe = current_user.recipes.new(recipe_params) 
        if recipe.save
        render json: recipe, include: :user, status: :created  
        else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private 
    def recipe_params 
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
