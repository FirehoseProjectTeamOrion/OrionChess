class Queen < Piece
  def chess_font_character
    if white?
      'q'
    else
      'w'
    end
  end
end
