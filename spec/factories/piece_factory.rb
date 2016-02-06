FactoryGirl.define do
  factory :piece do
    type 'Queen'
    row 0
    column 3
    in_game true
    association :player
    association :game
    after(:build) { |piece| piece.class.skip_callback(:create, :after, :populate_board!) }
  end
end
