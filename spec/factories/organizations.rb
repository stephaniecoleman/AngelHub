# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    # {} or blocks tell these attributes to be lazily loaded
    # meaning the content of the block are executed 
    # every time these attributes are requested
    # ultimately, defining these attributes differently for each instance
    name { Faker::Company.name }
    email { Faker::Internet.free_email }
    password Faker::Internet.password(8, 12)
    url { Faker::Internet.url("#{name}.com") }
    description Faker::Company.catch_phrase

    factory :organization_with_projects do

      ignore do
        count 5
        # generate developers for each project
        developers false
      end

      after(:create) do |organization, evaluator|
        count = evaluator.count
        list = create_list(:project, count, organization: organization)

        # if asked for developers, assign a random list of projects to a developer
        if evaluator.developers
          count.times do
            random_projects = list.sample(rand(1..count))
            create(:developer_with_projects, :associated_projects => random_projects)
          end
        end
      end
    end
  end

end
