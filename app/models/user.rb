class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :conversations, dependent: :destroy

  before_validation :normalize_profile_fields

  validates :name,
            length: { minimum: 2, maximum: 20 },
            allow_blank: true

  validates :jlpt_level,
            inclusion: { in: %w[N5 N4 N3 N2 N1],
                         message: "must be one of N5, N4, N3, N2, N1" },
            allow_blank: true

  private

  def normalize_profile_fields
    self.name = name.to_s.strip.presence
    self.jlpt_level = jlpt_level.to_s.strip.upcase.presence
  end
end