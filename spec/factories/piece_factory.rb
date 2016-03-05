FactoryGirl.define do
  factory :piece do
    type 'Pawn'
    row 1
    column 0
    in_game true
    association :user
    association :game
  end
end
