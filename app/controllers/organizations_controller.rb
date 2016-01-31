class OrganizationsController < ApplicationController
before_action :set_organization, only: [:show, :edit, :update, :destroy]
#before_action :require_correct_user, only: [:index, :show, :edit, :update]
before_action :require_signin
before_action :require_admin, only: [:destroy, :admin]

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @members = @organization.users
    @report = @organization.reports
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

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :user_ids, :created_at, :updated_at)
  end

  def report_params
    params.require(:report).permit(:title)
  end

  def user_params
    params.require(:user).permit(:name, :organization_ids)
  end


#  def require_correct_user
#   @user = User.find(params[:id])
#    unless current_user == @user
#     redirect_to root_url
#    end
#  end


end
