FactoryBot.define do
  factory :user do
    transient do
      set_password { 'password' }
    end
    
    username { "Test" }
    email { "#{username}@example.com" }

    factory :host do
      username { "Host" }

      after(:create) do |user, evaluator|
        user.password = evaluator.set_password
        user.save!
      end
    end

    factory :guest do
      username { "Guest" }
      
      after(:create) do |user, evaluator|
        user.password = evaluator.set_password
        user.save!
      end
    end
  end
end
