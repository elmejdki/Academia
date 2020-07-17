FactoryBot.define do
  factory :user do
    name { generate(:name) }
  end

  factory :event do
    association :host
    location { 'Somewhere' }
    time { DateTime.now + 2.day }
  end
end
