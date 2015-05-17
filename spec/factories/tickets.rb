FactoryGirl.define do
  factory :ticket do
    sequence(:name) { |n| "Ticket name#{n}}" }
    sequence(:description) { |n| "Ticket description#{n}}" }
    priority { rand(1..5) }
    difficulty { rand(1..5) }
    status { rand(-1..1) }
    association :project, :factory => :project
  end
end