class Price < ActiveRecord::Base
  attr_accessible :hidden, :in_stock, :item_id, :name, :price, :volume

  belongs_to :item
  belongs_to :order
end
