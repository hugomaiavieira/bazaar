class DropTableCategoriesSizes < ActiveRecord::Migration
  def change
    drop_table :categories_sizes
  end
end
