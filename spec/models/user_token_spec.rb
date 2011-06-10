describe UserToken do
  let(:klass) { UserToken }

  describe ".create" do
    it "returns a new token with the current time + 1 week" do
      Timecop.freeze
      token = klass.create('foo@bar.com')
      token.valid_until.should == (Time.now.utc + 1.week).to_i
      Timecop.return
    end
  end

   describe "#to_json" do
    it "encodes and converts the token to json" do
      UserToken.should_receive(:token_key) { 'abc' }
      token = klass.new('foo@bar.com', Time.new(2011))
      token.to_json.should == { "token" => "04085b08492210666f6f406261722e636f6d063a06454649753a0954696d650d28c01b8000000000073a0b405f7a6f6e6522085053543a0b6f666673657469fe808f2219d9144830c63ee6bea2cde03ff056bc8505d9d50e"
                              }.to_json
    end
  end
end
