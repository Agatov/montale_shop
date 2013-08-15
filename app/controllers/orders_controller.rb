class OrdersController < ApplicationController

  protect_from_forgery :except => :create

  def create

    @order = Order.new params[:order]

    if @order.save
      get_cart.volumes.each { |volume| OrderVolume.create(order_id: @order.id, volume_id: volume[:id]) }
      session[:cart] = nil

      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end