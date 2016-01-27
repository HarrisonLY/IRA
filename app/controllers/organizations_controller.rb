class OrganizationsController < ApplicationController
#before_action :require_correct_user, only: [:show, :edit, :update]
#before_action :require_signin, except: [:new, :create]
#before_action :require_admin, only: [:destroy, :index, :admin]

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @organization.users = @organization.users
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to @organization, notice: "Organization successfully updated!"
    else
      render :edit
    end
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.users << current_user
    if @organization.save
      redirect_to @organization, notice: "Organization successfully created!"
    else
	  render :new
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to admin_path, notice: "Organization successfully deleted!"
  end


  def admin
    @organizations = Organization.all
  end


private

  def organization_params
    params.require(:organization).permit(:name)
  end

#  def require_correct_user
#   @user = Organization.find(params[:id])
#    unless current_user == @user
#     redirect_to root_url
#    end
#  end

end
