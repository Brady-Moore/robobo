class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    @response = @conversation.responses.build(response_params)
    @response.from_user = true

    if @response.save
      redirect_to conversation_path(@conversation, anchor: "bottom")
    else
      @responses = @conversation.responses.order(:created_at)
      flash.now[:alert] = "Could not send message."
      render "conversations/show", status: :unprocessable_entity
    end
  end

  private

  def set_conversation
    @conversation = current_user.conversations.find(params[:conversation_id])
  end

  def response_params
    params.require(:response).permit(:content)
  end
end
