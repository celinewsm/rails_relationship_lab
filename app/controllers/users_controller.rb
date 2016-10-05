class UsersController < ApplicationController
  def new
  end

  def show
    @user_recipes = Recipe.where(user_id: current_user.id)
  end

  def create
    @user= User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_url, notice: 'User account created successfully'
    else
      render :new, notice: 'Invalid details'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,:password_confirmation)
  end

end
