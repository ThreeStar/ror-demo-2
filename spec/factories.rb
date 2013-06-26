FactoryGirl.define do
  factory :user do
    # name     "Blues Chow"
    # email    "blues@jpluscorp.com"
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "1988cheng"
    password_confirmation "1988cheng"
    
    factory :admin do
      admin true
    end
  end
end




