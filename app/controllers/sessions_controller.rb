class SessionsController < ApplicationController

def new
    @user = User.new
    if current_user
    redirect_to current_user, notice: "Already Signed In!"
  else
    render :new
  end
end

def create
  if user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    flash[:notice] = "Welcome back, #{user.name}!"
    redirect_to user
  else
    flash.now[:alert] = "Invalid email/password combination!"
    render :new
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "You're now signed out!"
end

end