class OrderPrice < ActiveRecord::Base
  attr_accessible :order_id, :price_id

  belongs_to :order
  belongs_to :price
end
