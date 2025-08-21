class ConversationsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_conversation, only: [:show, :destroy]

  def index
    @conversations = current_user.conversations.order(created_at: :desc)
  end

  def show
    @conversation = current_user.conversations.find(params[:id])
    @responses    = @conversation.responses.order(:created_at)
    @response     = Response.new
  end

  def new
    @conversation = Conversation.new
    @demo_conversation = Conversation.find_by(title: "Demo Conversation")
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    @response = Response.new(content: @conversation.submitted_text, role: "user", conversation: @conversation)
    if @conversation.save
      AiMessageService.new(@response).call
      redirect_to @conversation, notice: "Conversation started!"
    else
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @conversation.destroy
    redirect_to conversations_path, notice: "Conversation deleted"
  end

  private

  def set_conversation
    @conversation = current_user.conversations.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to conversations_path, alert: "Conversation not found"
  end

  def conversation_params
    params.require(:conversation).permit(:title, :submitted_text)
  end
end