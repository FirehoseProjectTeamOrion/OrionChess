class Piece < ActiveRecord::Base
  belongs_to :player
  belongs_to :game


scope :pawns, -> { where(type: 'Pawn') }
scope :knights, -> { where(type: 'Knight') }
scope :bishops, -> { where(type: 'Bishop') }
scope :rooks, -> { where(type: 'Rook') }
scope :queens, -> { where(type: 'Queen') }
scope :kings, -> { where(type: 'King') }

end
