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
      return !occupied_space?(destination_row, destination_column)
    elsif move == FORWARD_TWO && first_move?
      return !occupied_space?(destination_row, destination_column)
    elsif CAPTURE_MOVES.include?(move)
      return capturable?(destination_row, destination_column) || en_passant?(destination_column)
    end

    false
  end

  private

  FORWARD_ONE = [1, 0].freeze
  FORWARD_TWO = [2, 0].freeze
  CAPTURE_MOVES = [[1, 1], [1, -1]].freeze

  def first_move?
    created_at == updated_at
  end

  def en_passant?(destination_column)
    opponent = game.pieces.find_by(type: 'Pawn', color: opposite_color, row: row, column: destination_column)
  end
end
