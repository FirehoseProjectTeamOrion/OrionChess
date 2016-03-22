FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@gmail.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    name 'John Doe'
    wins 4
    losses 2
    username
    email
    password 'password'
    password_confirmation 'password'\
  end
end
