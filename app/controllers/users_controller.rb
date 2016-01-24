class UsersController < ApplicationController
before_action :require_correct_user, only: [:show, :edit, :update]
before_action :require_signin, except: [:new, :create]
before_action :require_admin, only: [:destroy, :index, :admin]

#has_many :reports, dependent: :destroy

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user, notice: "Account successfully updated!"
  else
    render :edit
  end
end

def new
  @user = User.new
    if current_user
    redirect_to current_user, notice: "Already Signed In!"
  else
    render :new
  end
end



def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to @user, notice: "Thanks for signing up!"
  else
    render :new
  end 
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to admin_path, notice: "Account successfully deleted!"
end


  def admin
    @users = User.all
  end


private

def user_params
  params.require(:user).
    permit(:name, :email, :password, :password_confirmation)
end

def require_correct_user
 @user = User.find(params[:id])
  unless current_user == @user
   redirect_to root_url
  end
end

end
