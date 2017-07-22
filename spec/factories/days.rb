FactoryGirl.define do
  factory :day do
    sequence :date do |t|
      "201#{t}-07-19"
    end
    user
  end
end
