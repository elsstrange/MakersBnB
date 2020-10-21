FactoryBot.define do
  factory :user do
    username { "Test" }
    email { "makersbnb@example.com" }

    factory :host do
      transient do
        set_password { 'password' }
      end

      after(:create) do |user, evaluator|
        user.password = evaluator.set_password
        user.save!
      end
    end

    factory :guest do
    end
  end
end
