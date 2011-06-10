class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CloudError, :with => :render_cloud_error

  private

  def render_cloud_error(e)
    render :status => e.status, :json => e
  end
end
