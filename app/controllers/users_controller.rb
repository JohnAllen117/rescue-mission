class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # GET /questions/1
  def show
    @user = User.find(params[:id])
  end

  # GET /questions/new
  def new
    @user = User.new
  end

  # POST /questions
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET /questions/search
  def search
    @users = User.search(params[:query])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
