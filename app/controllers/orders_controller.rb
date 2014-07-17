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
          to: 'montalemsk@gmail.com, abardacha@gmail.com',
          subject: I18n.t('project.new-order-title', locale: 'en', date: @order.date),
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
    end

    redirect_to '/cart/thank'
  end

  def fast
    @item = Item.find params[:item_id]

    message = "#{params[:phone]}"
    message += "\n"
    message += I18n.t('project.link-to-item', locale: 'en', brand_name: @item.brand.name, item_name: @item.index)

    Pony.mail ({
        to: 'montalemsk@gmail.com, abardacha@gmail.com',
        subject: I18n.t('project.fast-order-title', locale: 'en', date: Russian::strftime(Time.now, "%d %B %H:%M")),
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
  end
end