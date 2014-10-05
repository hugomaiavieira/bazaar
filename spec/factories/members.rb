# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    name "MyString"
    email "MyString"
    phone "MyString"
    document "MyString"
    birthday "2014-10-05"
    address "MyText"
    tax 1
  end
end
