class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    relationship = current_user.active_relationships.find_by(id: params[:id])
    relationship.destroy
    redirect_to users_path
  end
end
