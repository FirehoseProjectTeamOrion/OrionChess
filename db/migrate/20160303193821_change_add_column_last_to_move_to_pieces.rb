class ChangeAddColumnLastToMoveToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :last_to_move, :boolean, default: false
  end
end
