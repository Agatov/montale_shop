class ApplicationController < ActionController::Base
  protect_from_forgery


  def session_id
    session[:session_id]
  end

  def get_cart
    return session[:cart] if session[:cart]
    Cart.new
  end

  def set_cart(cart)
    session[:cart] = cart
  end

  helper_method :get_cart
end
