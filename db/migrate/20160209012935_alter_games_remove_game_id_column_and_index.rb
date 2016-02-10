class AlterGamesRemoveGameIdColumnAndIndex < ActiveRecord::Migration
  def change
    remove_column :games, :game_id
  end
end
