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
      raise "Input is invalid!"
    end
  end

  private

  def moving_horizontally?(row)
    self.row == row
  end

  def moving_vertically?(column)
    self.column == column
  end

  def moving_diagonally?(row, column)
    (self.row - row).abs == (self.column - column).abs
  end

  def is_horizontal_obstructed?(column)
    if self.column < column
      check_path(0, 1, column-self.column)
    else
      check_path(0, -1, self.column - column)
    end
  end

  def is_vertical_obstructed?(row)
    if self.row < row
      check_path(1, 0, row-self.row)
    else
      check_path(-1, 0, self.row-row)
    end
  end

  def is_diagonal_obstructed?(row, column)
    if self.row < row && self.column < column
      check_path(1, 1, row-self.row)
    elsif self.row < row && self.column > column
      check_path(1, -1, row-self.row)
    elsif self.row > row && self.column < column
      check_path(-1, 1, self.row-row)
    else
      check_path(-1, -1, self.row-row)
    end
  end

  def check_path(row_dir, col_dir, dist)
    obstructed = false
    cur_row = self.row
    cur_column = self.column

    (1...dist).each do |i|
      cur_row += row_dir
      cur_column += col_dir

      obstructed |= game.pieces.find_by(row: cur_row, column: cur_column).present?
    end

    obstructed
  end
end
