FactoryGirl.define do
  factory :queen, parent: :piece, class: 'Queen' do
    row 0
    column 3
    color 'white'
    in_game true
    association :user
    association :game
  end
end
