# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    name { Faker::Company.name }
    email { Faker::Internet.free_email }
    password Faker::Internet.password(8, 12)
    url { Faker::Internet.url("#{name}.com") }
    description Faker::Company.catch_phrase

    factory :organization_with_projects do

      ignore do
        count 5
        # generate a random number of developers for each project
        and_developers false
      end

      after(:create) do |organization, evaluator|
        list = create_list(:project, evaluator.count, organization: organization)
        if evaluator.and_developers
          list.each do |project|
            
          end
        end
      end
    end
  end

end
