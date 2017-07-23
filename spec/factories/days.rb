FactoryGirl.define do
  factory :day do
    sequence :date do |t|
      Date.today - 1 + t
    end

    user
  end
end
