FactoryGirl.define do
  factory :piece do
    type 'Queen'
    row 0
    column 3
    in_game true
    association :player
    association :game
  end

  factory :piece do
    type 'King'
    row 0
    column 4
    in_game true
    association :player
    association :game
  end
end
