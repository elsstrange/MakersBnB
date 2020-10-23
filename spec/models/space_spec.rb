require './app/models/space'

describe Space do
  let(:description) { BetterLorem.c(100, true, true) }
  let!(:user) { create(:user) }
  let!(:space) { described_class.new(name: 'A name', description: description, price: 50, host_id: user.id) }
  
  describe '#short_description' do
    it 'returns the first n characters of the description, based on the number provided' do
      expect(space.short_description(50)).to eq description[0..49]
    end
  end

  describe '#bookings' do
    let(:booking_class) { double("Booking class") }

    it 'calls #where on Booking class with space_id attribute' do
      expect(booking_class).to receive(:where).with(space_id: space.id)
      space.bookings(booking_class)
    end
  end
end
