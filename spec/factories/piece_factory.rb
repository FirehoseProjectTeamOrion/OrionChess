FactoryGirl.define do
  factory :piece do
    type 'Queen'
    row 0
    column 3
    in_game true
    association :player
    association :game
  end

end
