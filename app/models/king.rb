class King < Piece
  def valid_move?(destination_row, destination_col)
    direction = [destination_row - row, destination_col - column]
    kings_direction = [
      [1, 0],
      [-1, 0],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 1],
      [-1, -1],
      [-1, 1]
    ]
    return true if kings_direction.include?(direction)
    false
  end

  def chess_font_character
    if white?
      'k'
    else
      'l'
    end
  end

  def in_check?
    opponent_pieces = game.pieces.where(color: opposite_color)

    opponent_pieces.each do |opponent_piece|
      return true if opponent_piece.valid_move?(row, column)
    end

    false
  end

  def can_castle?(rook_row, rook_column)
    rook = Piece.where(color: color, row: rook_row, column: rook_column)
    return true if not_moved? && not_obstructed?(rook_row, rook_column) && rook.not_moved?
  end

  def castle!(rook_row, rook_column)
    if can_castle?(rook_row, rook_column)
      rook = Piece.where(color: color, row: rook_row, column: rook_row)
      if rook.kingside?
        update_attributes(row: rook_row, column: 6, moved: true)
        rook.update_attributes(row: rook_row, column: 5, moved: true)
        return true
      end
      if rook.queenside?
        update_attributes(row: rook_row, column: 2, moved: true)
        rook.update_attributes(row: rook_row, column: 3, moved: true)
        return true
      end
    end
    false
  end
end
