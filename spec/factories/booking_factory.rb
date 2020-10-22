FactoryBot.define do 
  factory :booking, aliases: [:pending_booking] do
    transient do
      space { create(:space) }
      guest { create(:guest) }
      advance_date { 1 }
    end
    
    status { 'pending' }
    date { Date.today >> advance_date }
    space_id { space.id }
    guest_id { guest.id }

    factory :confirmed_booking do
      status { 'confirmed' }
    end

    factory :cancelled_booking do
      status { 'cancelled' }
    end
  end
end
