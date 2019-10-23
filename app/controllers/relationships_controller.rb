class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:followed_id])
    current_user.follow(other_user)
    
    relationship = current_user.active_relationships.find_by(followed_id: other_user.id)
    relationship.create_activity(user: current_user)

    redirect_to user_url(other_user)
  end

  def destroy
    relationship = Relationship.find(params[:id])
    other_user= User.find(relationship.followed_id)
    current_user.unfollow(other_user)
    redirect_to user_url(other_user)
  end

end
