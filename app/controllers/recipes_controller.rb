class RecipesController < ApplicationController
  before_action :is_authenticated, except: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def create
    # @recipe = Recipe.new(recipe_params)
    # @recipe = current_user.recipes.new(recipe_params)
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = @current_user.id

    if @recipe.save
      redirect_to @recipe, notice: 'recipe was created successfully'
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    is_recipe_owner
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    s = Recipe.find(params[:id])
    s.update(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  def is_recipe_owner
    if current_user.id != @recipe.user_id
      flash[:danger] = "Credentials Invalid!!"
      redirect_to recipes_path
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name,:instructions,:servings,:cuisine_id, :course_ids => [],:ingredient_ids => [])
  end
end
