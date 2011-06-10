class UserToken
  class << self
    def create(username)
      valid_until = (Time.now.utc + 1.week).to_i
      new(username, valid_until)
    end
  end

  attr_reader :username, :valid_until

  def initialize(name, time)
    @username = name
    @valid_until = time
  end
end
