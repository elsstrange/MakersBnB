require './models/space'

describe Space do
  let(:description) { BetterLorem.c(100, true, true) }
  let!(:user) { create(:user) }
  let!(:space) { described_class.new(name: 'A name', description: description, price: 50, host_id: user.id) }
  
    describe '#cropped_description' do
    it 'returns the first n characters of the description, based on the number provided' do
      expect(space.short_description(50)).to eq description[0..49]
    end
  end
end