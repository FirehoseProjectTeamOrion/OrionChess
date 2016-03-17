class GamesController < ApplicationController
  before_action :set_game, :authenticate_user!, only: [:show, :edit, :update, :destroy]
  # GET /games
  # GET /games.json
  def index
    @games = Game.available
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = color_param == 'white' ? Game.new(white_player_id: user_param) : Game.new(black_player_id: user_param)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: { redirect: game_path(@game) } }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    color_param == 'white' ? current_game.update_attributes(white_player_id: user_param) : current_game.update_attributes(black_player_id: user_param)
    redirect_to game_path(current_game)
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def forfeit
    forfeiting_user = User.find(user_param)
    current_game.forfeit(forfeiting_user)
    redirect_to game_path(current_game), alert: 'Forfeit'
  end

  def promote_pawn
    pawn_to_promote = current_game.pieces.find(pawn_param)
    promoted_piece = pawn_to_promote.promote_pawn(promotion_param)
    respond_to do |format|
      format.html { render nothing: true, status: :ok }
      format.json { render nothing: true, json: { id: promoted_piece.id, chess_font_character: promoted_piece.chess_font_character }, status: :ok }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_param
    params.require(:user_id)
  end

  def color_param
    params.require(:color)
  end

  def pawn_param
    params.require(:pawn_id)
  end

  def promotion_param
    params.require(:promotion_type)
  end

  def current_game
    @current_game ||= Game.find(params[:id])
  end
end
