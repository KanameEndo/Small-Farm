class RemovePhoneNumberFromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :phone_number, :string
  end
end
