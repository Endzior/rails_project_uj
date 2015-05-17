FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Imie#{n}"}
    sequence(:last_name) { |n| "Nazwisko#{n}"}
    sequence(:email) { |n| "mail#{n}@mail.com" }
    password 'password' 
    admin { false }
  end
  
  factory :admin, parent: :user do
    admin { true }
  end
end