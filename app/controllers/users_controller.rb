class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @conversations = @user.conversations.order(created_at: :desc)
  end
end
