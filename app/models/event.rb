class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy

  validates :name, :date, presence: true
end
