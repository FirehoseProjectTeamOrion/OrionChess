class Piece < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  scope :pawns, -> { where(type: 'Pawn') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :queens, -> { where(type: 'Queen') }
  scope :kings, -> { where(type: 'King') }

  def obstructed?(destination_row, destination_column)
    return horizontal_obstructed?(destination_column) if moving_horizontally?(destination_row)
    return vertical_obstructed?(destination_row) if moving_vertically?(destination_column)
    return diagonal_obstructed?(destination_row, destination_column) if moving_diagonally?(destination_row, destination_column)

    fail 'Input is invalid!'
  end

  def move_to!(destination_row, destination_col)
    

   if !(empty_space?(destination_row, destination_column)) 
     if capturable?(destination_row, destination_column)
       destination_piece.update_attributes(:row => nil, :column => nil, :in_game => false)
     end
   end
   
  end
   
   def empty_space?(d_row, d_column)
     destination_piece = game.pieces.where(:row => d_row, :column => d_column)
     return true unless destination_piece.nil?
   end
   
   
   def capturable?(row, colomn)
     game.pieces.where(:row => row, :column => column, :in_game => true).where.not(color: color).present?
   end
   
   
   

  protected

  def white?
    color == 'white'
  end

  def black?
    color == 'black'
  end

  private

  NONE = 0
  UP = 1
  DOWN = -1
  RIGHT = 1
  LEFT = -1

  def destination_piece
    destination_
  end

  def moving_horizontally?(destination_row)
    row == destination_row
  end

  def moving_vertically?(destination_column)
    column == destination_column
  end

  def moving_diagonally?(destination_row, destination_column)
    (row - destination_row).abs == (column - destination_column).abs
  end

  def moving_up_and_to_the_right?(destination_row, destination_column)
    row < destination_row && column < destination_column
  end

  def moving_up_and_to_the_left?(destination_row, destination_column)
    row < destination_row && column > destination_column
  end

  def moving_down_and_to_the_right?(destination_row, destination_column)
    row > destination_row && column < destination_column
  end

  def horizontal_obstructed?(destination_column)
    return check_path(NONE, RIGHT, destination_column - column) if column < destination_column

    check_path(NONE, LEFT, column - destination_column)
  end

  def vertical_obstructed?(destination_row)
    return check_path(UP, NONE, destination_row - row) if row < destination_row

    check_path(DOWN, NONE, row - destination_row)
  end

  def diagonal_obstructed?(destination_row, destination_column)
    return check_path(UP, RIGHT, destination_row - row) if moving_up_and_to_the_right?(destination_row, destination_column)

    return check_path(UP, LEFT, destination_row - row) if moving_up_and_to_the_left?(destination_row, destination_column)

    return check_path(DOWN, RIGHT, row - destination_row) if moving_down_and_to_the_right?(destination_row, destination_column)

    check_path(DOWN, LEFT, row - destination_row)
  end

  def check_path(row_direction, col_direction, distance)
    current_row = row
    current_column = column

    (1...distance).each do |_i|
      current_row += row_direction
      current_column += col_direction

      return true if game.pieces.find_by(row: current_row, column: current_column).present?
    end

    false
  end
end
