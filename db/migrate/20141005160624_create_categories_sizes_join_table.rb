class CreateCategoriesSizesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :sizes do |t|
      t.index [:category_id, :size_id]
      t.index [:size_id, :category_id]
    end
  end
end
