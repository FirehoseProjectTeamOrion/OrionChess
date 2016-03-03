class PiecesController < ApplicationController
  def update
    row = pieces_params[:row].to_i
    column = pieces_params[:column].to_i

    render(nothing: true, status: :ok) && return if current_piece.move_to!(row, column)

    render nothing: true, status: :bad_request
  end

  private

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def pieces_params
    params.require(:piece).permit(:row, :column)
  end
end
