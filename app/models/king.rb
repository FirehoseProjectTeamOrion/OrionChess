class King < Piece
  def chess_font_character
    if white?
      'k'
    else
      'l'
    end
  end
end
