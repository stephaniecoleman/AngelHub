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
        project_count 5
      end

      after(:create) do |organization, evaluator|
        project_count = evaluator.project_count
        project_count = project_count.call if project_count.is_a? Proc
        project_count = project_count.to_i
        create_list(:project, project_count, organization: organization)
      end


    end
  end

end
