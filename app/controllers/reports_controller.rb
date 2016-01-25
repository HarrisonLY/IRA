class ReportsController < ApplicationController
before_action :set_user
before_action :require_signin
before_action :require_admin, only: [:admin]

  def index
    @reports = @current_user.reports
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
      redirect_to reports_path,
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
    params.require(:report).permit(:title, :created_at, :updated_at, :user_id)
  end

end
