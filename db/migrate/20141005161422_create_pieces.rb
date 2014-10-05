class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.references :category, index: true
      t.references :brand, index: true
      t.references :size, index: true
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
