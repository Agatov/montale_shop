class ItemsController < ApplicationController
  def index
    params[:brand_name] = 'montale' unless params[:brand_name]
    @brand = Brand.find_by_index params[:brand_name]

    if params[:family_id]
      @items = @brand.items.where(family_id: params[:family_id]).order('original_name')
    else
      @items = @brand.items.order('original_name')
    end

  end

  def show
    if params[:item_name]
      @item = Item.find_by_index params[:item_name]
    else
      @item = Item.find params[:id]
    end
  end
end