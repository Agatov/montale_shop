class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.order(:id)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new params[:item]

    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
  end
end