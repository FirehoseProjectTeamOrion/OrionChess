class Pawn < Piece
  def chess_font_character
    if white?
      'p'
    else
      'o'
    end
  end

  def valid_move?(destination_row, destination_column)
    move = [destination_row - row, destination_column - column]

    move[0] *= -1 if white?

    if move == FORWARD_ONE
      return space_unoccupied?(destination_row, destination_column)
    elsif move == FORWARD_TWO && in_starting_row?
      return space_unoccupied?(destination_row, destination_column)
    elsif CAPTURE_MOVES.include?(move)
      return can_capture?(destination_row, destination_column)
    end

    false
  end

  private

  FORWARD_ONE = [1, 0].freeze
  FORWARD_TWO = [2, 0].freeze
  CAPTURE_MOVES = [[1, 1], [1, -1]].freeze

  def in_starting_row?
    return row == 6 if white?

    row == 1
  end

  def opposite_color
    if white?
      'black'
    else
      'white'
    end
  end

  def space_unoccupied?(destination_row, destination_column)
    !game.pieces.where(row: destination_row, column: destination_column).exists?
  end

  def can_capture?(destination_row, destination_column)
    game.pieces.where(row: destination_row, column: destination_column, color: opposite_color).exists?
  end
end
