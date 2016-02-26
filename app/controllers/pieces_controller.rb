class PiecesController < ApplicationController

  def update
    current_piece.update_attributes(pieces_params)
    render text: 'updated!'
  end

  def valid_moves
    valid_spaces = []
    (0..7).each do |row|
      (0..7).each do |column|
        if current_piece.valid_move?(row, column)
          valid_spaces << {row: row, column: column}
        end
      end
    end
  end

  private

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def pieces_params
    params.require(:piece).permit(:row, :column)
  end
end
