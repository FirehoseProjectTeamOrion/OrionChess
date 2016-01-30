class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string  :name
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
    add_index :players, :player_id
  end
end
