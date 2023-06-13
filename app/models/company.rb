class Company < ApplicationRecord
  has_many :contacts
  has_many :jobs

  validates_presence_of :name
end
