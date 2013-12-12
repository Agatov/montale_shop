class Admin::PricesController < Admin::AdminController

  def index
    @item = Item.find params[:item_id]
  end

  def show
  end

  def new
    @item = Item.find params[:item_id]
    @price = Price.new(item_id: @item.id)
  end

  def create
    @price = Price.new params[:price]

    if @price.save
      redirect_to admin_item_prices_path(@price.item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find params[:item_id]
    @price = Price.find params[:id]
  end

  def update
    @item = Item.find params[:item_id]
    @price = Price.find params[:id]

    if @price.update_attributes(params[:price])
      redirect_to admin_item_prices_path(@price.item)
    else
      render :edit
    end
  end

  def destroy
    @price = Price.find params[:id]
    @price.destroy
    redirect_to :back
  end
end