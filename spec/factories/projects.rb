FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project name#{n}}" }
    sequence(:description) { |n| "Project description#{n}}" }
  end
  
  factory :project_with_tickets, parent: :project do
    transient do
      tickets_count { 5 }
    end
    after(:create) do |project, eval|
      create_list(:ticket, eval.tickets_count, project: project)
    end
  end
end