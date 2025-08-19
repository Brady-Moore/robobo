class User < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :responses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
