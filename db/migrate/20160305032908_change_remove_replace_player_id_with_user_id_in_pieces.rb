class ChangeRemoveReplacePlayerIdWithUserIdInPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :player_id, :integer
    add_column :pieces, :user_id, :integer
    add_index :pieces, :user_id
  end
end
