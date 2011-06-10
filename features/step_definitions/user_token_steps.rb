When /^I make a valid API request for a user token$/ do
  Timecop.freeze
  post "users/#{@user.email}/tokens", :password => "#{@user.password}"
end

Then /^I should receive a valid token in the response$/ do
  last_response.headers["Content-Type"].should == "application/json; charset=utf-8"
  response = Yajl::Parser.new.parse(last_response.body)
  decoded_token = UserToken.decode(response["token"])
  decoded_token.username.should == @user.email
  decoded_token.valid_until.should == (Time.now + 1.week).to_i
  Timecop.return
end
