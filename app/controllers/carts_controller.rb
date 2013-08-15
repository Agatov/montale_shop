class CartsController < ApplicationController

  protect_from_forgery :except => [:create, :clear, :remove]

  def show
    logger.info get_cart.volumes
    @volumes = Volume.find get_cart.volumes.map {|v| v[:id]}
  end

  def create
    @volume = Volume.find params[:volume_id]

    @cart = get_cart
    @cart.add @volume
    set_cart @cart

    render partial: 'carts/widget'
  end


  def clear
    session[:cart] = nil
    render json: {status: :ok}
  end

  def remove
    @volume = Volume.find params[:volume_id]

    @cart = get_cart
    @cart.remove @volume
    set_cart @cart

    render partial: 'carts/widget'
  end
end