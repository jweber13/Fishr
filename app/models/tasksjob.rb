class Tasksjob < ApplicationRecord
  belongs_to :jobs
  belongs_to :tasks
end
