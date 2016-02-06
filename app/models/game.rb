class Game < ActiveRecord::Base
  has_many :pieces
  has_one  :white_player, class_name: 'User'
  has_one  :black_player, class_name: 'User'
  scope :available, -> {where('black_player_id IS NULL OR white_player_id IS NULL'}
end
