class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    # @conversations = @user.conversations.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_path, alert: "Not authorized") unless @user == current_user
  end
end
