class ApplicationController < ActionController::Base
  def current_restaurant_id
    cookies[:restaurant_id]
  end
end
