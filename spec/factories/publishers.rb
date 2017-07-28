FactoryGirl.define do
  factory :publisher do
    sequence(:name){ |n| "publisher-#{n}" }
  end
end
