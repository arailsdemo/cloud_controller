When /^I make a valid API request for a user token$/ do
  post "users/#{@user.email}/tokens", password: "#{@user.password}"
end

Then /^I should receive a valid token in the response$/ do
  pending # express the regexp above with the code you wish you had
end
