class ChangeAddColumnAtivePlayerIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :active_player_id, :integer
    add_index :games, :active_player_id
  end
end
