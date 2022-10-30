# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /reports
  def index
    @reports = Report.all.order(created_at: :DESC)
  end

  # GET /reports/1
  def show
    @report = Report.find(params[:id])
    @comments = @report.comments.includes(:user)
  end

  # GET /reports/new
  def new
    @report = Report.new
    @user_id = current_user.id
  end

  # GET /reports/1/edit
  def edit
    @user_id = current_user.id
  end

  # POST /reports
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to report_url(@report), notice: t('controllers.common.notice_create', name:Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.notice_update', name:Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name:Report.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :body, :user_id)
    # params.fetch(:report, {})
  end
end
