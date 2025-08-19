class ConversationsController < ApplicationController
  def index
    @conversations = Conversations.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
# ----------------------------------------------------------------------------------#
# TODO: make the user able to edit the conversation title (FOR LATER IF POSSIBLE)
  # def edit
  # end

  # def update
  # end
# ----------------------------------------------------------------------------------#
end
