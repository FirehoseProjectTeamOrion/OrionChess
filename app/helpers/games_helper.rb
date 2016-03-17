module GamesHelper
  def draw_piece(game, row, column)
    piece = game.pieces.find_by(row: row, column: column)

    return if piece.nil?

    content_tag(:span, piece.chess_font_character, class: 'piece', data: { update_url: piece_path(piece) })
  end

  def join_link(game)
    color = game.black_player.nil? ? 'black' : 'white'

    link_to 'Join', game_path(game, color: color, user_id: current_user.id), method: :update
  end
end
