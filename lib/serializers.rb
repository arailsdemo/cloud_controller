module Serializers
  class Bcrypt
    def load(content)
      return unless content
      BCrypt::Password.new content
    end

    def dump(content)
      BCrypt::Password.create(content).to_s
    end
  end
end
