class Job < ApplicationRecord
  belongs_to :fishing_trip
  belongs_to :company

  has_many :document_jobs
  has_many :documents, through: :document_jobs

  has_many :tasksjobs
  has_many :tasks, through: :tasksjobs

  enum :status, {
    created: 0,
    sent: 1,
    contacted: 2,
    interview: 3,
    offer: 4,
    reject_company: 5,
    reject_user: 6,
    accept: 7,
    no_feedback: 8
  }

  validates_presence_of :title, :content, :status
  validates_type :title, :string
  validates_type :url, :string
end
