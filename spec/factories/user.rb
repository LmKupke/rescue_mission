FactoryGirl.define do
  factory :user do
    name "Lincoln Kupke"
    sequence (:email) { |n| "lincolnkupke#{n}@gmail.com" }
    password "password"
    uid "1234"
  end
end
