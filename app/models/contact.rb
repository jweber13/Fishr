class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true

  validates_presence_of :firstname
end
