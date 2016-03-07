class ChangeAddPreviousRowAndColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :previous_row, :integer
    add_column :pieces, :previous_column, :integer
  end
end
