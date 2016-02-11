FactoryGirl.define do
  factory :rook, parent: :piece, class: 'Rook' do
    row 0
    column 7
    in_game true
    association :player
    association :game
  end
end
