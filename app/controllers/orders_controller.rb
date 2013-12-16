class OrdersController < ApplicationController

  protect_from_forgery :except => :create

  def create
    @order = Order.new params[:order]

    if @order.save
      get_cart.volumes.each { |volume| OrderPrice.create(order_id: @order.id, price_id: volume[:id]) }
      session[:cart] = nil

      message = "#{params[:order][:username]}. #{params[:order][:phone]}"
      message += "\n"
      message += I18n.t('crm.order.link', locale: 'en', id: @order.id.to_s)

      Pony.mail ({
          to: 'montalemsk@gmail.com, abardacha@gmail.com, kostyadt@gmail.com',
          subject: I18n.t('email.title', locale: 'en'),
          body: message,
          via: :smtp,
          via_options: {
              address: 'smtp.gmail.com',
              port: 587,
              enable_starttls_auto: true,
              user_name: 'montalemsk',
              password: 'kotkotkot232323',
              authentication: :plain
          }
      })

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