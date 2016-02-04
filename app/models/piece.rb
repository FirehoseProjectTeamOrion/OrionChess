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
    obstructed = false
    if self.column < column
      (self.column+1...column).each do |x_pos|
        obstructed |= game.pieces.find_by(row: self.row, column: x_pos).present?
      end
    else
      (column+1...self.column).each do |x_pos|
        obstructed |= game.pieces.find_by(row: self.row, column: x_pos).present?
      end
    end

    obstructed
  end

  def is_vertical_obstructed?(row)
    obstructed = false
    if self.row < row
      (self.row+1...row).each do |y_pos|
        obstructed |= game.pieces.find_by(row: y_pos, column: self.column).present?
      end
    else
      (row+1...self.row).each do |y_pos|
        obstructed |= game.pieces.find_by(row: y_pos, column: self.column).present?
      end
    end

    obstructed
  end

  def is_diagonal_obstructed?(row, column)
    obstructed = false
    if self.row < row && self.column < column
      (1...row-self.row).each do |n|
        obstructed |= game.pieces.find_by(row: self.row+n, column: self.column+n).present?
      end
    elsif self.row < row && self.column > column
      (1...row-self.row).each do |n|
        obstructed |= game.pieces.find_by(row: self.row+n, column: self.column-n).present?
      end
    elsif self.row > row && self.column < column
      (1...self.row-row).each do |n|
        obstructed |= game.pieces.find_by(row: self.row-n, column: self.column+n).present?
      end
    else
      (1...self.row-row).each do |n|
        obstructed |= game.pieces.find_by(row: self.row-n, column: self.column-n).present?
      end
    end

    obstructed
  end
end
