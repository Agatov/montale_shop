class ItemsController < ApplicationController
  def index


    @brand = Brand.find_by_index params[:brand]
    @items = @brand.items.order('original_name')

    #if params[:family_id]
    #  @items = Item.where(family_id: params[:family_id]).order(:id)
    #else
    #  @items = Item.order(:id)
    #end

  end

  def show
    #@item = Item.find params[:id]

    if params[:item_name]
      @item = Item.find_by_index params[:item_name]
    end
  end
end