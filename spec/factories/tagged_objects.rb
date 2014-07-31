# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagged_object do
    ignore do
      taggables [:project]
    end

    tag { build_stubbed(:tag) }
    taggable { build_stubbed(taggables.sample) }
  end
end
