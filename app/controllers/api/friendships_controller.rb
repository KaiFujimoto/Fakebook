class Api::FriendshipsController < ApplicationController

  before_action :require_login

  def send_req #create
    @friendship = Friendship.new()
    @friendship.user_id = current_user.id
    @friendship.friend_id = params[:user_id]
    if @friendship.save
      render :show
    else
      render json: @friendship.errors.full_messages, status: 422
    end
  end

  def approve_req #update
    @friendship = current_user.pending_friendships.find_by(user_id: params[:user_id])
    @friendship.status = 'APPROVED'
    @friendship.save!
    render :show
  end

  def pending #index 2
    @friendship = current_user.pending_friend_ids
    render :index
  end

  def reject_req #destroy
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: current_user.id) || Friendship.find_by(user_id: current_user.id, friend_id: params[:user_id])
    
    @friendship.destroy!
    render :show
  end

  def index
    user = User.find(params[:user_id])
    @friends = user.current_friends
    render :index
  end

end
