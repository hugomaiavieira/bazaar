class AddFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address, :text
    add_column :customers, :obs, :text
    add_column :customers, :document, :string
  end
end
