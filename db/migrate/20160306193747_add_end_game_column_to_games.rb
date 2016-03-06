class AddEndGameColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :end_game, :boolean
  end
end
