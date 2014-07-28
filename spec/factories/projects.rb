# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :project do
    title [Faker::Hacker.noun, Faker::Hacker.verb].shuffle.join('-')
    repository { Faker::Internet.url('github.com/angel_hub', title) }
    description Faker::Lorem.sentences(8)
  end
end
