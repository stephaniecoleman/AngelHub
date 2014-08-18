# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorized_object do
    categorizable nil
    category nil
  end
end
