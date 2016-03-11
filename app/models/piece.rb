class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  scope :pawns, -> { where(type: 'Pawn') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :queens, -> { where(type: 'Queen') }
  scope :kings, -> { where(type: 'King') }

  def self.types
    %w(Pawn Knight Bishop Rook Queen King)
  end

  def obstructed?(destination_row, destination_column)
    return horizontal_obstructed?(destination_column) if moving_horizontally?(destination_row)
    return vertical_obstructed?(destination_row) if moving_vertically?(destination_column)
    return diagonal_obstructed?(destination_row, destination_column) if moving_diagonally?(destination_row, destination_column)

    fail 'Input is invalid!'
  end

  def move_to!(destination_row, destination_column)
    return false unless valid_move?(destination_row, destination_column)
    return update_piece_location(destination_row, destination_column) unless occupied_space?(destination_row, destination_column)
    return false unless capturable?(destination_row, destination_column)
    opponent = Piece.where(game_id: game.id, row: destination_row, column: destination_column, in_game: true)
    opponent[0].remove_piece
    update_piece_location(destination_row, destination_column)
  end

  def occupied_space?(destination_row, destination_column)
    opponent = Piece.where(game_id: game.id, row: destination_row, column: destination_column, in_game: true)
    return true if opponent.where(row: destination_row, column: destination_column).exists?
  end

  def capturable?(destination_row, destination_column)
    Piece.where(game_id: game.id, row: destination_row, column: destination_column, in_game: true, color: opposite_color).exists?
  end

  def not_moved?
    return true unless moved
    false
  end

  def not_obstructed?(destination_row, destination_column)
    return true unless obstructed?(destination_row, destination_column)
    false
  end

  protected

  def white?
    color == 'white'
  end

  def black?
    color == 'black'
  end

  def opposite_color
    if white?
      'black'
    else
      'white'
    end
  end

  def remove_piece
    update_attributes(row: nil, column: nil, in_game: false)
  end

  def update_piece_location(destination_row, destination_column)
    previous_piece_moved = game.pieces.find_by(last_to_move: true)

    previous_piece_moved.update_attributes(last_to_move: false) if previous_piece_moved

    update_attributes(previous_row: row, previous_column: column, row: destination_row, column: destination_column, last_to_move: true)
  end

  def unoccupied_space?(destination_row, destination_column)
    !occupied_space?(destination_row, destination_column)
  end

  def unobstructed?(destination_row, destination_column)
    !obstructed?(destination_row, destination_column)
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

  private

  NONE = 0
  UP = -1
  DOWN = 1
  RIGHT = 1
  LEFT = -1

  def moving_up_and_to_the_right?(destination_row, destination_column)
    row > destination_row && column < destination_column
  end

  def moving_up_and_to_the_left?(destination_row, destination_column)
    row > destination_row && column > destination_column
  end

  def moving_down_and_to_the_right?(destination_row, destination_column)
    row < destination_row && column < destination_column
  end

  def horizontal_obstructed?(destination_column)
    return check_path(NONE, RIGHT, destination_column - column) if column < destination_column

    check_path(NONE, LEFT, column - destination_column)
  end

  def vertical_obstructed?(destination_row)
    return check_path(UP, NONE, row - destination_row) if row > destination_row

    check_path(DOWN, NONE, destination_row - row)
  end

  def diagonal_obstructed?(destination_row, destination_column)
    return check_path(UP, RIGHT, row - destination_row) if moving_up_and_to_the_right?(destination_row, destination_column)

    return check_path(UP, LEFT, row - destination_row) if moving_up_and_to_the_left?(destination_row, destination_column)

    return check_path(DOWN, RIGHT, destination_row - row) if moving_down_and_to_the_right?(destination_row, destination_column)

    check_path(DOWN, LEFT, destination_row - row)
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
