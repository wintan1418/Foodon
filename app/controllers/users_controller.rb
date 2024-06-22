class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @timetables = @user.timetables
  end

  def profile
    @user = User.find(params[:id])
    @followers = @user.followers
    @following = @user.followees
    @timetables = @user.timetables
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user, notice: 'You are now following this user.'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to @user, notice: 'You have unfollowed this user.'
  end
end
