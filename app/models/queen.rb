class Queen < Piece
  def valid_move?(destination_row, destination_column)
    if legal_path?(destination_row, destination_column) && not_obstructed?(destination_row, destination_column)
      return true if piece_present?(destination_row, destination_column) && opponent_piece?(destination_row, destination_column)
      return false
    end
    false
  end

  def opponent_piece?(destination_row, destination_column)
    game.pieces.find_by(row: destination_row, column: destination_column).color != color
  end

  def piece_present?(destination_row, destination_column)
    game.pieces.find_by(row: destination_row, column: destination_column).present?
  end

  def legal_path?(destination_row, destination_column)
    is_moving_horizontally?(destination_row) || is_moving_vertically?(destination_column) || is_moving_diagonally?(destination_row, destination_column)
  end

  def not_obstructed?(destination_row, destination_column)
    return false if obstructed?(destination_row, destination_column)
    true
  end

  def chess_font_character
    if white?
      'q'
    else
      'w'
    end
  end

  private

  def is_moving_horizontally?(destination_row)
    row == destination_row
  end

  def is_moving_vertically?(destination_column)
    column == destination_column
  end

  def is_moving_diagonally?(destination_row, destination_column)
    (row - destination_row).abs == (column - destination_column).abs
  end
end
