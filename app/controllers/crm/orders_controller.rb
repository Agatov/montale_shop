class Crm::OrdersController < Crm::CrmController
  def index
    @orders = Order.order('id desc')
  end

  def show
    @order = Order.find params[:id]
  end
end