FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@gmail.com"
  end

  factory :user do
    name 'John Doe'
    wins 4
    losses 2
    email
    password 'password'
    password_confirmation 'password'\
  end
end
