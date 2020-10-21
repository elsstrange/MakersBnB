require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username:, password:)
    user = find_by(username: username)
    
    return nil if user.nil?
    return nil if user.password != password

    user
  end
end
