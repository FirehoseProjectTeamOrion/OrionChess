FactoryGirl.define do
  factory :bishop, parent: :piece, class: 'Bishop' do
    row 0
    column 5
    in_game true
    association :player
    association :game
  end
end
