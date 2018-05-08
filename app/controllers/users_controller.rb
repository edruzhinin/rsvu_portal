class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
 # before_action :correct_user
  def new
  	@user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def create
		@user = User.new(user_params)
		
		if @user.save
			sign_in @user
			flash[:success] = "Добро пожаловать!"
			redirect_to @user
		else
		
			render 'new'
		end
		
	end
	
	private 
	def user_params
  	params.require(:user).permit(:firstname, :lastname, :secondname,:login,:email, :password, :password_confirmation) 
  end
  
  def signed_in_user
    unless signed_in?
    	store_location
    	redirect_to signin_url, notice: "Please sign in." 
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
