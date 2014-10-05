class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :category_id
      t.integer :brand_id
      t.integer :size_id
      t.integer :status, default: 0
      t.date :entry_date
      t.date :outbound_date
      t.integer :price
      t.string :code
      t.text :obs

      t.timestamps
    end
  end
end
