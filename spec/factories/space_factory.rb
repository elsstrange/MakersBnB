FactoryBot.define do 
  factory :space do
    transient do
      host { create(:host) }
    end
    
    name { "A lovely room with a view" }
    description { BetterLorem.w(100, true, true) }
    price { 50 }
    host_id { host.id }
  end
end
