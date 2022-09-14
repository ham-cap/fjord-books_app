# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @the_number_of_followings = @user.followings.count
    @the_number_of_followers = @user.followers.count
    @following = current_user.active_relationships.find_by(followed_id: @user.id)
    @follow = current_user.active_relationships.build
  end

  def followings
    @followings = User.find(id: params[:id]).followings
  end

  def followers
    @followers = User.find(params[:id]).followers.preload(:avatar_attachment)
  end
end
