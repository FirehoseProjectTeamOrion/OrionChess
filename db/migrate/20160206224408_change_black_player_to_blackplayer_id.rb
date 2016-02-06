class ChangeBlackPlayerToBlackplayerId < ActiveRecord::Migration
  def change
    rename_column :games, :black_player, :black_player_id
    rename_column :games, :white_player, :white_player_id
  end
end
