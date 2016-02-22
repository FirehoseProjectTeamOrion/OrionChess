class Queen < Piece
  def valid_move?(destination_row, destination_column)
    # return !(obstructed?(destination_row, destination_column)) if moving_horizontally?(destination_row) || moving_vertically?(destination_column) || moving_diagonally?(destination_row, destination_column)
    # return  game.pieces.find_by(row: current_row, column: current_column).where.not(color: color).present? if obstructed?(destination_row, destination_column)
    # false

    if legal_path?(destination_row, destination_column)
      # return 1
      if not_obstructed?(destination_row, destination_column)
        return 3
        if game.pieces.find_by(row: destination_row, column: destination_column).present?
          return 5
          if game.pieces.find_by(row: destination_row, column: destination_column).color != color
            return 7
            # return true
          else
            return 8
            # return false # opponent pieces?
          end
        else
          return 6
          # return true # it has pieces?
        end
      else
        return 4
        # return false # not_obstructed?(destination_row, destination_column)
      end
    else
      # return 2
      return false # moving_horizontally etc etc
    end
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
