class Game < ActiveRecord::Base
  has_many :pieces
  belongs_to  :white_player, class_name: 'User'
  belongs_to  :black_player, class_name: 'User'
  belongs_to  :winning_player, class_name: 'User'
  belongs_to  :active_player, class_name: 'User'

  after_create :populate_board!

  def populate_board!
    order_of_back_row = %w(Rook Knight Bishop Queen King Bishop Knight Rook)
    order_of_back_row.each_with_index do |type, column|
      Piece.create(type: type, game: self, color: 'black', row: 0, column: column)
      Piece.create(type: type, game: self, color: 'white', row: 7, column: column)

      Piece.create(type: 'Pawn', game: self, color: 'black', row: 1, column: column)
      Piece.create(type: 'Pawn', game: self, color: 'white', row: 6, column: column)
    end
  end

  def check?
    white_king = pieces.find_by(type: 'King', color: 'white')
    black_king = pieces.find_by(type: 'King', color: 'black')

    white_king.in_check? || black_king.in_check?
  end

  def forfeit(forfeiting_user)
    update_attributes(winning_player_id: other_player(forfeiting_user), over: true)
  end

  def other_player(player)
    player == white_player ? black_player.id : white_player.id
  end

  def pass_turn(player)
    update_attributes(active_player_id: other_player(player))
  end

  def stalemate?
    king_not_in_check? && available_move?
  end

  def king_not_in_check?
    king = pieces.find_by(type: 'King', color: current_color)
    return true unless king.in_check?
    false
  end

  def available_move?
    all_piece = pieces.where(in_game: true)
    all_piece.each do |piece|
      return true if piece.any_move?
    end
    false
  end

  def current_color
    return 'white' if active_player == white_player
    'black'
  end
end
