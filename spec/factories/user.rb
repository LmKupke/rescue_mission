FactoryGirl.define do
  factory :user do
    name "Lincoln Kupke"
    sequence (:email) { |n| "lincolnkupke#{n}@gmail.com" }
    password "password"
  end
end
