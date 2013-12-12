class Brand < ActiveRecord::Base
  attr_accessible :name, :index

  has_many :items
end
