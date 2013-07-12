FactoryGirl.define do
  factory :earthquake do
    sequence(:source_id)
    src "test"
    datetime { 1.week.ago }
  end
end
