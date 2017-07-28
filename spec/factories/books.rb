FactoryGirl.define do
  factory :book do
    sequence(:name){ |n| "book-#{n}" }
    publisher
  end
end
