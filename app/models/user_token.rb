class UserToken
  class << self
    attr_accessor :token_key

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

  def to_json(options=nil)
    Yajl::Encoder.encode({"token" => encoded_token})
  end

  def encoded_token
    data = [username, valid_until, hmac]
    Marshal.dump(data).unpack('H*').first
  end

  def hmac
    @hmac ||= HMAC::SHA1.new(self.class.token_key)
                        .update([username, valid_until].join)
                        .digest
  end
end
