class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :fishing_trip, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :url
      t.text :content
      t.integer :status
      t.string :tags
      t.string :title

      t.timestamps
    end
  end
end
