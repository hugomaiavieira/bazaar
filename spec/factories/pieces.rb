# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :piece do
    category
    status 1
    entry_date "2014-10-05"
    outbound_date "2014-10-05"
    price 1
    code "MyString"
    obs "MyText"
  end
end
