# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :developer do
    name { Faker::Name.name }
    email { Faker::Internet.email(name) }
    password Faker::Internet.password(8, 12)
    github_url { Faker::Internet.url('github.com/', name) }

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
