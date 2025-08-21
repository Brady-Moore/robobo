class Conversation < ApplicationRecord
  acts_as_chat
  after_initialize :set_chat

  belongs_to :user
  has_many :messages, class_name: "Response", dependent: :destroy

  validates :title, length: { maximum: 50 }, allow_blank: true

  before_create :set_default_title

    def set_chat
    @chat = RubyLLM.chat
    end

    def responses
      self.messages
    end


  private

  def set_default_title
    if title.blank?
      self.title = "Started on #{created_at&.strftime('%b %d, %Y') || Date.today.strftime('%b %d, %Y')}"
    end
  end
end
