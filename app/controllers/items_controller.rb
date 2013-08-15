class ItemsController < ApplicationController
  def index
    @items = Item.order(:id)
  end

  def show
    @item = Item.find params[:id]
  end
end