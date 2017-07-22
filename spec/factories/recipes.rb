FactoryGirl.define do
  factory :recipe do
    sequence :name do |t|
      "MyString#{t}"
    end 
    calories 1
    servings 1
  end
end
