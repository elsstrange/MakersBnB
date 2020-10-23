require './app/models/booking'

describe Booking do
  let(:space_class) { double("Space class") }
  let!(:space) { create(:space) }
  let(:booking) { create(:booking, space_id: space.id) }

  describe '#space' do
    it 'calls .find_by on the Space class, with the booking space_id attribute' do
      expect(space_class).to receive(:find_by).with(id: space.id)
      booking.space(space_class)
    end
  end
end
