class Document < ApplicationRecord
  belongs_to :user

  has_many :document_jobs
  has_many :jobs, through: :document_jobs

  validates_presence_of :filename, :category, :data
end
