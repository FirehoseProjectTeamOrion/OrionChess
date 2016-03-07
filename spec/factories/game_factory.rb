FactoryGirl.define do
  factory :game do
    association :white_player, factory: :user
    association :black_player, factory: :user
  end
end
