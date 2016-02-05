class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :type
      t.integer :row
      t.integer :column
      t.boolean :in_game
      t.integer :player_id
      t.integer :game_id
      

      t.timestamps
    end

    add_index :pieces, :game_id
    add_index :pieces, :player_id
  end
end
