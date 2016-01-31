class ReportsController < ApplicationController
before_action :set_user
before_action :require_signin
before_action :require_admin, only: [:admin]


   def index
    @reports = Report.all
    @organization = @current_user.organizations
  end

  def show
   @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report,
        notice: "Thanks for your report!"
    else
      render :new
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice: "report successfully deleted!"
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to @report, notice: "Report successfully updated!"
    else
      render :edit
    end
  end

  def admin
    @reports = Report.all
  end

  
private

  def set_user
    @current_user
  end

  def report_params
    params.require(:report).permit(:title)
  end

  def organization_params
    params.require(:organization).permit(:name, :user_ids)
  end

  def user_params
    params.require(:user).permit(:name, :organization_ids)
  end

end