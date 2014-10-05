class AddMemberIdToPieces < ActiveRecord::Migration
  def change
    add_reference :pieces, :member, index: true
  end
end
