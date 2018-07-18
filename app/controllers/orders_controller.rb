require_relative "../views/orders_view"

class OrdersController

  def initialize(order_repo)
    @order_repo = order_repo
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repo.undelivered_orders
    @view.display(orders)
  end

end
