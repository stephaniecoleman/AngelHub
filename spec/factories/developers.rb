# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :developer do
    name Faker::Internet.user_name
    email { Faker::Internet.free_email }
    password Faker::Internet.password(8, 12)
    github_url { Faker::Internet.url(name) }
  end

  factory :developer_with_projects do

    ignore do
      count 5
    end

    after(:create) do |organization, evaluator|
      create_list(:project, evaluator.count, developer: developer)
    end
  end

end
