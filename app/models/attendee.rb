class Attendee < ApplicationRecord
  belongs_to :event

  before_validation :generate_token, on: :create

  validates :full_name, presence: true
  validates :token, uniqueness: true, presence: true

  private

  def generate_token
    self.token ||= SecureRandom.hex(10)
  end
end
