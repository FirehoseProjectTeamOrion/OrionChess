class Knight < Piece
  def chess_font_character
    if white?
      'n'
    else
      'm'
    end
  end
end
