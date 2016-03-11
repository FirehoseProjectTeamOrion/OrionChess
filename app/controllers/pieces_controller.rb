class PiecesController < ApplicationController
  def update
    row = pieces_params[:row].to_i
    column = pieces_params[:column].to_i

    if current_piece.move_to!(row, column)
      current_piece.game.pass_turn(current_piece.game.active_player)
      respond_to do |format|
        format.html { render nothing: true, status: :ok }
        format.json { render nothing: true, json: { piece: current_piece, piece_type: current_piece.type }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render nothing: true, status: :bad_request }
        format.json { render nothing: true, status: :bad_request }
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
