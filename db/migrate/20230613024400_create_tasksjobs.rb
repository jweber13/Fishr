class CreateTasksjobs < ActiveRecord::Migration[7.0]
  def change
    create_table :tasksjobs do |t|
      t.references :jobs, null: false, foreign_key: true
      t.references :tasks, null: false, foreign_key: true

      t.timestamps
    end
  end
end
