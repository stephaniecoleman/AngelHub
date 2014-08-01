# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :developer do
    name { Faker::Name.name }
    email { Faker::Internet.email(name) }
    password Faker::Internet.password(8, 12)
    github_url { Faker::Internet.url('github.com/', name) }
    image { "https://github.com/identicons/#{name}.png"}

    factory :developer_with_projects do

      ignore do
        count 0
        associated_projects { build_list(:projects, count) }
      end

      after(:create) do |developer, evaluator|
        associated_projects = evaluator.associated_projects
        associated_projects = associated_projects.call if associated_projects.is_a? Proc
        developer.projects << associated_projects
      end
    end
  end

end
