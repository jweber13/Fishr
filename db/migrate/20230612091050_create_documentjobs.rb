class CreateDocumentjobs < ActiveRecord::Migration[7.0]
  def change
    create_table :documentjobs do |t|
      t.references :job, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
