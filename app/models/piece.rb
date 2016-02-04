class Piece < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  scope :pawns, -> { where(type: 'Pawn') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :queens, -> { where(type: 'Queen') }
  scope :kings, -> { where(type: 'King') }

  def is_obstructed?(row, column)
    if moving_horizontally?(row)
      is_horizontal_obstructed?(column)
    elsif moving_vertically?(column)
      is_vertical_obstructed?(row)
    elsif moving_diagonally?(row, column)
      is_diagonal_obstructed?(row, column)
    else
      fail 'Input is invalid!'
    end
  end

  private

  NONE = 0
  UP = 1
  DOWN = -1
  RIGHT = 1
  LEFT = -1

  def moving_horizontally?(row)
    self.row == row
  end

  def moving_vertically?(column)
    self.column == column
  end

  def moving_diagonally?(row, column)
    (self.row - row).abs == (self.column - column).abs
  end

  def moving_up_and_to_the_right?(row, column)
    self.row < row && self.column < column
  end

  def moving_up_and_to_the_left?(row, column)
    self.row < row && self.column > column
  end

  def moving_down_and_to_the_right?(row, column)
    self.row > row && self.column < column
  end

  def is_horizontal_obstructed?(column)
    if self.column < column
      check_path(NONE, RIGHT, column - self.column)
    else
      check_path(NONE, LEFT, self.column - column)
    end
  end

  def is_vertical_obstructed?(row)
    if self.row < row
      check_path(UP, NONE, row - self.row)
    else
      check_path(DOWN, NONE, self.row - row)
    end
  end

  def is_diagonal_obstructed?(row, column)
    if moving_up_and_to_the_right?(row, column)
      check_path(UP, RIGHT, row - self.row)
    elsif moving_up_and_to_the_left?(row, column)
      check_path(UP, LEFT, row - self.row)
    elsif moving_down_and_to_the_right?(row, column)
      check_path(DOWN, RIGHT, self.row - row)
    else
      check_path(DOWN, LEFT, self.row - row)
    end
  end

  def check_path(row_dir, col_dir, dist)
    obstructed = false
    cur_row = row
    cur_column = column

    (1...dist).each do |_i|
      cur_row += row_dir
      cur_column += col_dir

      obstructed |= game.pieces.find_by(row: cur_row, column: cur_column).present?
    end

    obstructed
  end
end
