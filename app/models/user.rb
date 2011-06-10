class User < ActiveRecord::Base
  serialize :password, Serializers::Bcrypt.new

  def self.valid_login?(email, password)
    if user = find_by_email(email)
      user.password == password
    end
  end
end
