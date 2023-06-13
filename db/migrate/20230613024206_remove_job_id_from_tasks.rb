class RemoveJobIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :job_id
  end
end
