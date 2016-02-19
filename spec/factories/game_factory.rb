FactoryGirl.define do
  factory :game do
    
    
    association :white_player_id, factory: :player
    association :black_player_id, factory: :player
  end
end
