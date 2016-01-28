class ReportsController < ApplicationController
before_action :set_user
before_action :require_signin
before_action :require_admin, only: [:admin]

  def index
    @personal_reports = @current_user.reports
    @organization = @current_user.organizations
#    @organization_reports = @organization.reports
  end

  def show
   @report = Report.find(params[:id])
  end

  def new
    @report = @current_user.reports.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = @current_user.reports.new(report_params)
    if @report.save
      redirect_to @report,
        notice: "Thanks for your report!"
    else
      render :new
    end
  end

  def destroy
    @report = @current_user.reports.find(params[:id])
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
    params.require(:report).permit(:title, :reportable_type, :reportable_id, :created_at, :updated_at)
  end

  def organization_params
    params.require(:organization).permit(:name, :user_ids)
  end

  def user_params
    params.require(:user).permit(:name, :organization_ids)
  end


end
