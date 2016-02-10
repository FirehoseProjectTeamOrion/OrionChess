class Bishop < Piece
  def chess_font_character
    if white?
      'b'
    else
      'v'
    end
  end
end
