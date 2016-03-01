class PiecesController < ApplicationController
  def update
    row = pieces_params[:row].to_i
    column = pieces_params[:column].to_i

    if current_piece.valid_move?(row, column)
      current_piece.update_attributes(pieces_params)
      render text: 'updated!'
    else
      render text: 'invalid', status: :bad_request
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
