class ItemsController < ApplicationController
  def index
    if params[:family_id]
      @items = Item.where(family_id: params[:family_id]).order(:id)
    else
      @items = Item.order(:id)
    end

  end

  def show
    @item = Item.find params[:id]
  end
end