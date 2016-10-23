class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to "/users"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/new"
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to "/users"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/users/#{@user.id}/edit"
  	end	
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to "/users"
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

