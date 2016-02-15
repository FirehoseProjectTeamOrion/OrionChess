module GamesHelper
  def draw_piece(game, row, column)
    piece = game.pieces.find_by(row: row, column: column)

    return if piece.nil?

    link_to piece_path(piece) do
      piece.chess_font_character
    end
  end
end
