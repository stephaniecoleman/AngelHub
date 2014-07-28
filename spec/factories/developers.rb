# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :developer do
    name Faker::Internet.user_name
    email { Faker::Internet.free_email }
    password Faker::Internet.password(8, 12)
    github_url { Faker::Internet.url(name) }

    factory :developer_with_projects do

      ignore do
        associated_projects []
      end

      after(:create) do |developer, evaluator|
        developer.projects << evaluator.associated_projects
      end
    end
  end
  
end
