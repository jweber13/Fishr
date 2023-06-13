class Task < ApplicationRecord
  belongs_to :user

  has_many :tasksjobs
  has_many :jobs, through: :tasksjobs

  enum :status, { created: 0, in_progress: 1, finished: 2 }

  validates_presence_of :name, :status, :category, :deadline
end
