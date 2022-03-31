# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    @comment = report.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save!
      redirect_to report
    else
      render 'shared/_comment_error'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
