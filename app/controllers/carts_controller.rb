class CartsController < ApplicationController

  protect_from_forgery :except => [:create, :clear, :remove]

  def show
    logger.info get_cart.volumes
    @prices = Price.find get_cart.volumes.map {|v| v[:id]}
  end

  def create
    @price = Price.find params[:volume_id]

    @cart = get_cart
    @cart.add @price
    set_cart @cart

    render partial: 'carts/widget'
  end


  def clear
    session[:cart] = nil
    render json: {status: :ok}
  end

  def remove
    @price = Price.find params[:volume_id]

    @cart = get_cart
    @cart.remove @price
    set_cart @cart

    redirect_to :back

    #render partial: 'carts/widget'
  end
end