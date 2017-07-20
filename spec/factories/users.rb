FactoryGirl.define do
  factory :user do
    sequence :username do |t|
      "Username#{t}"
    end

    password "password"
  end
end
