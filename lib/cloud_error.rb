class CloudError < StandardError
  attr_reader :status

  def initialize(info, *args)
    @error_code, @status, msg = *info
    @message = sprintf(msg, *args)
    super(@message)
  end

  def to_json(options = nil)
    Yajl::Encoder.encode({:code => @error_code, :description => @message})
  end

  HTTP_FORBIDDEN = 403

  FORBIDDEN = [200, HTTP_FORBIDDEN, "Operation not permitted"]
end
