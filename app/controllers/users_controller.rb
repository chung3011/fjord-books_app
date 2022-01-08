# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  def followings
    @users = @user.followings.page(params[:page])
    render :index
  end

  def followers
    @users = @user.followers.page(params[:page])
    render :index
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
