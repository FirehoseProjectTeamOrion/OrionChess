FactoryGirl.define do
  factory :white_bishop, parent: :piece, class: 'Bishop' do
    row 0
    column 2
    color 'white'
    in_game true
    association :player
    association :game
  end

  factory :black_bishop, parent: :piece, class: 'Bishop' do
    row 4
    column 6
    in_game true
    color 'black'
    association :player
    association :game
  end
end
