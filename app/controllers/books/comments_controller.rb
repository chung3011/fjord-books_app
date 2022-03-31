# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to book
    else
      render 'shared/_comment_error'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
