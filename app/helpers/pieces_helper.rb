module PiecesHelper
  def pieces_draw_piece(cur_piece, row, column)
    piece = cur_piece.game.pieces.find_by(row: row, column: column)

    if piece.nil?
      link_to '', piece_path(cur_piece, piece: { row: row, column: column }), method: :put, class: 'empty-space'
    elsif cur_piece.id == piece.id
      link_to piece_path(piece), id: 'selected' do
        piece.chess_font_character
      end
    else
      link_to piece_path(piece) do
        piece.chess_font_character
      end
    end
  end
end
