# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    name Faker::Company.name
    email Faker::Internet.free_email
    password Faker::Internet.password(8, 12)
    url { Faker::Internet.url(name) }
    description Faker::Company.catch_phrase

    factory :organization_with_projects do

      ignore do
        count 5
      end

      after(:create) do |organization, evaluator|
        create_list(:project, evaluator.count, organization: organization)
      end
    end
  end

end
