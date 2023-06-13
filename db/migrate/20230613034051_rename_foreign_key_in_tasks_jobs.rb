class RenameForeignKeyInTasksJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasksjobs, :jobs_id, :job_id
    rename_column :tasksjobs, :tasks_id, :task_id
  end
end
