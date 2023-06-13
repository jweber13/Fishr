class Tasksjob < ApplicationRecord
  belongs_to :job
  belongs_to :task
end
