# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    email "MyString"
    phone "MyString"
    birthday "2014-10-05"
  end
end
