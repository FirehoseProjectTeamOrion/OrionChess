class Rook < Piece
  
  def valid_move?(destination_row, destination_col)
    direction = [destination_row - row, destination_col - column]
    rooks_direction = [
      [1, 0],
      [-1, 0],
      [0, -1],
      [0, 1],

	  [2, 0],
      [-2, 0],
      [0, -2],
      [0, 2],      

      [3, 0],
      [-3, 0],
      [0, -3],
      [0, 3],
            
      [4, 0],
      [-4, 0],
      [0, -4],
      [0, 4],
            
      [5, 0],
      [-5, 0],
      [0, -5],
      [0, 5],
            
      [6, 0],
      [-6, 0],
      [0, -6],
      [0, 6],

      [7, 0],
      [-7, 0],
      [0, -7],
      [0, 7],
    ]
    return true if rooks_direction.include?(direction)
    false
  end

  def chess_font_character
    if white?
      'r'
    else
      't'
    end
  end
end
