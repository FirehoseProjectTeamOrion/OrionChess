FactoryGirl.define do
  factory :king, parent: :piece, class: 'King' do
    row 0
    column 4
    in_game true
    association :user
    association :game
  end
end
