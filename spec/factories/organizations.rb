# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    name Faker::Company.name
    email Faker::Internet.free_email
    password Faker::Internet.password(8, 12)
    url { Faker::Internet.url(name) }
    description Faker::Company.catch_phrase

    factory :organization_with_projects do

      after(:create) do |organization, evaluator|
        
      end
    end
  end

end
