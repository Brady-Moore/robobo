class Response < ApplicationRecord
  belongs_to :conversation

  validates :content, presence: true, length: { maximum: 1000 }
  validates :from_user, inclusion: { in: [true, false] }
end
