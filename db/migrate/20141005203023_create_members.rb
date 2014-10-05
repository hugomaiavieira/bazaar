class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :document
      t.date :birthday
      t.text :address
      t.integer :tax, default: 40

      t.timestamps
    end
  end
end
