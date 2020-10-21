require './models/user'

describe User do
  describe '#authenticate' do
    let(:username) { 'Test' }
    let(:wrong_username) { 'test' }
    let(:password) { 'some_password' }
    let(:wrong_password) { 'wrong password' }
    let!(:user) { described_class.new(username: username) }
    
    before do
      user.password = password
      user.save!
    end

    it 'returns user if password and username are valid' do
      expect(User.authenticate(username: username, password: password)).to be_a(User)
    end

    it 'returns nil if username is invalid' do
      expect(User.authenticate(username: wrong_username, password: password)).to be_nil
    end

    it 'returns nil if password is invalid' do
      expect(User.authenticate(username: username, password: wrong_password)).to be_nil      
    end
  end
end