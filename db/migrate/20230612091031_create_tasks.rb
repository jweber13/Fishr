class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :category
      t.integer :status
      t.date :deadline
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
