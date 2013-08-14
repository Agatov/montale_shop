class Volume < ActiveRecord::Base
  attr_accessible :hidden, :in_stock, :item_id, :price, :volume

  belongs_to :item
end
