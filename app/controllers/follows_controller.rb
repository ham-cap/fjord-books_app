# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Follow.find_by(id: params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
