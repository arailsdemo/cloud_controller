class UserTokensController < ApplicationController
  def create
    email = params[:email]
    if User.valid_login?(email, params[:password])
      token = UserToken.create(email)
      render :json => token
    else
      render :status => 403, :json => { "code" => 200, "description" => "Operation not permitted" }
    end
  end
end
