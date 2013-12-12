class Crm::OrdersController < Crm::CrmController
  def index
    @orders = Order.order('id desc')
  end

  def show
    @order = Order.find params[:id]
  end

  def edit
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]

    if @order.update_attributes params[:order]
      redirect_to crm_order_path(@order)
    else
      render :edit
    end
  end
end