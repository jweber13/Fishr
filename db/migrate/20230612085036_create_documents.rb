class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :file_size
      t.string :category
      t.text :data
      t.string :filename

      t.timestamps
    end
  end
end
