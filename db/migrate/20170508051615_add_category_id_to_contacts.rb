class AddCategoryIdToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :category_id, :integer
  end
end
