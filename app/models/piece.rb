class Piece < ActiveRecord::Base
    belongs_to :player
    belongs_to :game
end

scope :pawns, -> { where(race: 'Pawn') }
scope :knights, -> { where(race: 'Knight') }
scope :bishops, -> { where(race: 'Bishop') }
scope :rooks, -> { where(race: 'Rook') }
scope :queens, -> { where(race: 'Queen') }
scope :kings, -> { where(race: 'King') }
