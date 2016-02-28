class PiecesController < ApplicationController
  def update
    current_piece.update_attributes(pieces_params)
    render text: 'updated!'
  end

  private

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def pieces_params
    params.require(:piece).permit(:row, :column)
  end
end
