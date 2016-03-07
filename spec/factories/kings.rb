FactoryGirl.define do
  factory :king, parent: :piece, class: 'King' do
    row 0
    column 4
    color 'white'
    in_game true
    association :player
    association :game
  end
end
