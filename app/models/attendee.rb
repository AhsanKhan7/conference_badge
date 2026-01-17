class Attendee < ApplicationRecord
  belongs_to :event

  validates :full_name, presence: true
end
