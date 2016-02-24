class Knight < Piece

def valid_move?(destination_row, destination_column)


end


  def chess_font_character
    if white?
      'n'
    else
      'm'
    end
  end
end
