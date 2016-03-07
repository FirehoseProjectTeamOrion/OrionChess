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
      return unoccupied_space?(destination_row, destination_column)
    elsif move == FORWARD_TWO
      return can_move_two?(destination_row, destination_column)
    elsif CAPTURE_MOVES.include?(move)
      return can_capture?(destination_row, destination_column)
    end

    false
  end

  protected

  def previously_moved_two_spaces?
    (row - previous_row).abs == 2
  end

  private

  FORWARD_ONE = [1, 0].freeze
  FORWARD_TWO = [2, 0].freeze
  CAPTURE_MOVES = [[1, 1], [1, -1]].freeze

  def first_move?
    created_at == updated_at
  end

  def en_passant?(destination_column)
    opponent_pawn = game.pieces.find_by(type: 'Pawn', color: opposite_color, row: row, column: destination_column)
    opponent_pawn.present? && opponent_pawn.previously_moved_two_spaces? && opponent_pawn.last_to_move
  end

  def can_capture?(destination_row, destination_column)
    capturable?(destination_row, destination_column) || en_passant?(destination_column)
  end

  def can_move_two?(destination_row, destination_column)
    first_move? && unoccupied_space?(destination_row, destination_column) && unobstructed?(destination_row, destination_column)
  end
end
