class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :white_player
      t.integer :black_player

      t.timestamps
    end

    add_index :games, :game_id
  end
end
