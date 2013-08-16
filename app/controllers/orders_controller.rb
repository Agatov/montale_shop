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

  def fast
    @item = Item.find params[:item_id]

    phones = %w(79037928959 79057376916)

    message = "#{params[:phone]}. #{@item.original_name}"

    phones.each do |phone|
      HTTParty.get(
          'http://api.sms24x7.ru',
          query: {
              method: 'push_msg',
              email: 'agatovs@gmail.com',
              password: 'avv6rqE',
              phone: phone.to_s,
              text: message,
              sender_name: 'montaleshop'
          }
      )
    end

    render json: {status: :ok}
  end
end