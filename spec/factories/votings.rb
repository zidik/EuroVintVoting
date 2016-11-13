FactoryGirl.define do
  factory :voting do
    name "My Voting"
    trait :running do
      running true
    end
  end
end
