class UserTokensController < ApplicationController
  def create
    email = params[:email]
    if User.valid_login?(email, params[:password])
      token = UserToken.create(email)
      render :json => token
    else
      raise CloudError.new(CloudError::FORBIDDEN)
    end
  end
end
