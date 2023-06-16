class AddColumnsToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :title, :string
    add_column :contacts, :note, :text
  end
end
