class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "Successful registration"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], :per_page => 3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show_blog
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], :per_page => 5)
  end

  def set_admin
    @user = User.find(params[:id])
    @user.set_admin
    @user.save
    redirect_to @user
  end

  def set_user
    @user = User.find(params[:id])
    @user.set_user
    @user.save
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end