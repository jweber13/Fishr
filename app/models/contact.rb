class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true

  validates_presence_of :firstname
  validates_type :firstname, :string
  validates_type :lastname, :string
  validates_type :email, :string
  validates_type :phone, :string
  validates_type :linkedin, :string
  validates_type :insta, :string
  validates_type :twitter, :string
end
