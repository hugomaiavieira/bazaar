class AddObsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :obs, :text
  end
end
