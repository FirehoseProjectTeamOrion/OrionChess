class Queen < Piece
  def valid_move?(destination_row, destination_column)
    if legal_path?(destination_row, destination_column) && unobstructed?(destination_row, destination_column)
      return true if unoccupied_space?(destination_row, destination_column) || capturable?(destination_row, destination_column)
      return false
    end
    false
  end

  def legal_path?(destination_row, destination_column)
    moving_horizontally?(destination_row) || moving_vertically?(destination_column) || moving_diagonally?(destination_row, destination_column)
  end

  def chess_font_character
    if white?
      'q'
    else
      'w'
    end
  end
end
