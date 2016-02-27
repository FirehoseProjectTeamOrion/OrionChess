FactoryGirl.define do
  factory :knight, parent: :piece, class: 'Knight' do
    row 0
    column 1
    color 'white'
    in_game true
    association :player
    association :game
  end
end
