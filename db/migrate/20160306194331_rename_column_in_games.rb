class RenameColumnInGames < ActiveRecord::Migration
  def change
    rename_column :games, :end_game, :game_over
  end
end
