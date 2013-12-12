class Order < ActiveRecord::Base
  attr_accessible :phone, :username, :delivery_address, :delivery_time


  after_save :send_notification

  has_many :order_prices
  has_many :prices, through: :order_prices


  def send_notification
    phones = %w(79037928959 79057376916)

    message = "#{username}. #{phone}"

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
  end
end
