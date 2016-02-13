class PiecesController < ApplicationController
  def show
    @piece = Piece.find(params[:id])
  end

  def update
    current_piece.update_attributes(pieces_params)
    redirect_to game_path(current_piece.game)
  end

  private

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def pieces_params
    params.require(:piece).permit(:row, :column)
  end
end
