# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :project do
    title { [Faker::Hacker.noun, Faker::Hacker.verb, Faker::Hacker.ingverb, Faker::Hacker.adjective].shuffle.join('-') }
    repository { Faker::Internet.url('github.com/angel_hub/', title) }
    description Faker::Lorem.sentence(8)

    organization { build_stubbed(:organization) }
  end
end
