class Rook < Piece
  def valid_move?(destination_row, destination_column)
    if vertical?(destination_column) || horizontal?(destination_row)
      return true if capturable?(destination_row, destination_column) || (unobstructed?(destination_row, destination_column) && unoccupied_space?(destination_row, destination_column))
    end
    false
  end

  def unobstructed?(destination_row, destination_column)
    !obstructed?(destination_row, destination_column)
  end

  def unoccupied_space?(destination_row, destination_column)
    !occupied_space?(destination_row, destination_column)
  end

  def chess_font_character
    if white?
      'r'
    else
      't'
    end
  end

  private

  def horizontal?(destination_row)
    row == destination_row
  end

  def vertical?(destination_column)
    column == destination_column
  end
end
