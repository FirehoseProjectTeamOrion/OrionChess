class ChangeAddColumnOverToGames < ActiveRecord::Migration
  def change
    add_column :games, :over, :boolean
  end
end
