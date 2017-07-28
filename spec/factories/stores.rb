FactoryGirl.define do
  factory :store do
    sequence(:name){ |n| "store-#{n}" }
    company
  end
end
