class Item < ActiveRecord::Base
  attr_accessible :about, :brand_id, :hidden, :image, :in_stock, :original_name, :price, :russian_name
end
