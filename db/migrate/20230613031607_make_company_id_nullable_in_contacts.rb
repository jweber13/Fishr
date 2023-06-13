class MakeCompanyIdNullableInContacts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contacts, :company_id, true
  end
end
