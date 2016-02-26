module GamesHelper
  def draw_piece(game, row, column)
    piece = game.pieces.find_by(row: row, column: column)

    return if piece.nil?

    content_tag(:span, piece.chess_font_character, class: 'piece', data: {update_url: piece_path(piece), valid_moves_url: valid_moves_url(piece)})
  end
end
