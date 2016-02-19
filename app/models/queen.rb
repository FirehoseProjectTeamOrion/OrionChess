class Queen < Piece

  def valid_move?(destination_row, destination_column)


      # return !(obstructed?(destination_row, destination_column)) if moving_horizontally?(destination_row) || moving_vertically?(destination_column) || moving_diagonally?(destination_row, destination_column)
      # return  game.pieces.find_by(row: current_row, column: current_column).where.not(color: color).present? if obstructed?(destination_row, destination_column)
      # false

      if moving_horizontally?(destination_row) || moving_vertically?(destination_column) || moving_diagonally?(destination_row, destination_column)
        if !(obstructed?(destination_row, destination_column))
          if game.pieces.find_by(row: destination_row, column: destination_column).present?
            if game.pieces.find_by(row: destination_row, column: destination_column).color != color 
              return true
            else
              return false #opponent pieces?
            end
          else
            return true # it has pieces?
          end
        else
          return false #!(obstructed?(destination_row, destination_column))
        end
      else
        return false #moving_horizontally etc etc
      end
    # direction = [destination_row - row, destination_col - column]
    # queens_direction = [
    #   [1, 0],
    #   [-1, 0],
    #   [0, -1],
    #   [0, 1],
    #   [1, -1],
    #   [1, 1],
    #   [-1, -1],
    #   [-1, 1]
    # ]
    # return game.pieces.find_by(row: current_row, column: current_column).where.not(color: color).present?
    # if obstructed?(destination_row, destination_column)


  end

  def chess_font_character
    if white?
      'q'
    else
      'w'
    end
  end


  private

  def moving_horizontally?(destination_row)
    row == destination_row
  end

  def moving_vertically?(destination_column)
    column == destination_column
  end

  def moving_diagonally?(destination_row, destination_column)
    (row - destination_row).abs == (column - destination_column).abs
  end

end
