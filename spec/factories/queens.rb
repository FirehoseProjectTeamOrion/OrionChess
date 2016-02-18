FactoryGirl.define do
  factory :queen, parent: :piece, class: 'Queen' do
    row 0
    column 4
    in_game true
    association :player
    association :game
  end
end
