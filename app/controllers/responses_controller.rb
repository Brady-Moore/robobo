class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    @response = Response.new(response_params)
    @response.conversation = @conversation
    @response.from_user = true
    # @ai = "it worked"
    if @response.save
      @ai = AiMessageService.new(@response).call
      redirect_to conversation_path(@conversation), notice: "Message sent!"
    else
      @responses = @conversation.responses.order(:created_at)
      flash.now[:alert] = "Could not send message."
      render "conversations/show", status: :unprocessable_entity
    end
  end
# @ai = RubyLLM.chat.ask("whats the latest iphone?").content
# puts "---------------------"
# puts @ai
# puts "---------------------"
  private

  def set_conversation
    @conversation = current_user.conversations.find(params[:conversation_id])
  end

  def response_params
    params.require(:response).permit(:content)
  end
end
