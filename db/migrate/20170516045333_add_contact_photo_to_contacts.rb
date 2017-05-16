class AddContactPhotoToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :contact_photo, :string
  end
end
