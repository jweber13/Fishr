class FishingTrip < ApplicationRecord
  belongs_to :user

  has_many :jobs

  validates_presence_of :name
end
