# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :earthquake do
    src "MyString"
    version 1
    datetime "2013-07-10 23:46:23"
  end
end
