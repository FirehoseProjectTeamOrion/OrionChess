class Bishop < Piece
  def valid_move?(destination_row, destination_column)
    if diagonal?(destination_row, destination_column)
      return true if capturable?(destination_row, destination_column) || (unobstructed?(destination_row, destination_column) && unoccupied_space?(destination_row, destination_column))
      return false
    end
    false
  end

  def unobstructed?(destination_row, destination_column)
    return true unless obstructed?(destination_row, destination_column)
    false
  end

  def unoccupied_space?(destination_row, destination_column)
    return true unless occupied_space?(destination_row, destination_column)

    false
  end

  def chess_font_character
    if white?
      'b'
    else
      'v'
    end
  end

  private

  def diagonal?(destination_row, destination_column)
    (row - destination_row).abs == (column - destination_column).abs
  end
end
