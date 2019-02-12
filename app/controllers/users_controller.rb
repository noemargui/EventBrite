class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_events = @user.events
  end

  def new
  end

  def edit
    #@user = User.new(first_name: params[:content], last_name: params[:title], user: current_user)
  end
end
