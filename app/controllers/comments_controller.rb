# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1
  def show;
    @commentable_path = @comment.commentable_type == "Book" ? book_path(@comment.commentable_id) : report_path(@comment.commentable_id)
  end

  # POST /comments
  def create
    @comment = @commentable.comments.new(user_id: current_user.id, content: comment_params[:content])
    if @comment.save
      redirect_to [@commentable, @comment], notice: t('controllers.common.notice_create', name:Comment.model_name.human)
    else
      render file: "#{Rails.root}/public/422.html", layout: false
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
