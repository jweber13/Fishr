class AddSocialLinksToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :insta, :string
    add_column :contacts, :linkedin, :string
    add_column :contacts, :twitter, :string
  end
end
