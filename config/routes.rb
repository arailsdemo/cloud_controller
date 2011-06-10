Vcap::Application.routes.draw do
  post "users/*email/tokens" => "user_tokens#create", :as => :create_token
end
