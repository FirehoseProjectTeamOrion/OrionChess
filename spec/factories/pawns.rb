FactoryGirl.define do
  factory :pawn, parent: :piece, class: 'Pawn' do
    row 0
    column 7
    in_game true
    association :player
    association :game
  end
end
