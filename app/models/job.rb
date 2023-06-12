class Job < ApplicationRecord
  belongs_to :fishing_trip
  belongs_to :company
end
