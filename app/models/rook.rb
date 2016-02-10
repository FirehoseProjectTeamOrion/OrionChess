class Rook < Piece
  def chess_font_character
    if white?
      'r'
    else
      't'
    end
  end
end
