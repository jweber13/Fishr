class Contact < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  belongs_to :company, optional: true

  validates_presence_of :firstname

  # multisearchable against: %I[firstname lastname email phone insta linkedin twitter title note]
  # single search model
  pg_search_scope :search_contact,
    against: [
      :title, :firstname, :lastname, :email, :phone,
      :insta, :linkedin, :twitter, :note
    ],
    associated_against: {
      company: %I[name website address description]
    },
    using: {
      tsearch: { prefix: true }
    }
end
