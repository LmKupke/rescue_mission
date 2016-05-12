FactoryGirl.define do
  factory :user do
    fname "Lincoln"
    lname "Kupke"
    sequence (:email) { |n| "lincolnkupke#{n}@gmail.com" }
    password "password"
  end
end
