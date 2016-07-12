FactoryGirl.define do
  factory :questions do

    sequence(:title){ |i| "Test Question ##{i}" }
    body "This is a test question. The answer does not matter"

  end


end
