require './app/models/booking'

describe Booking do
  let!(:guest) { create(:user) }
  let!(:space) { create(:space) }
  let(:booking) { create(:booking, space_id: space.id, guest_id: guest.id) }

  describe '#space' do
    let(:space_class) { double('Space class') }

    it 'calls .find_by on the Space class, with the booking space_id attribute' do
      expect(space_class).to receive(:find_by).with(id: space.id)
      booking.space(space_class)
    end
  end

  describe '#guest' do
    let(:user_class) { double('User class') }

    it 'calls .find_by on the User class, with the booking guest_id attribute' do
      expect(user_class).to receive(:find_by).with(id: guest.id)
      booking.guest(user_class)
    end
  end
end
