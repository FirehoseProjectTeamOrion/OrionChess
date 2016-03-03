class ChangeGiveInGameDefaultValueOfTrue < ActiveRecord::Migration
  def change
    change_column :pieces, :in_game, :boolean, default: true
  end
end
