require_relative "../views/orders_view"

class OrdersController

  def initialize(order_repo, meal_repo, employee_repo, customer_repo)
    @order_repo = order_repo
    @meal_repo = meal_repo
    @employee_repo = employee_repo
    @customer_repo = customer_repo
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repo.undelivered_orders
    @view.display(orders)
  end

  def add
    meal = ask_user_one_of(@meal_repo.all)
    employee = ask_user_one_of(@employee_repo.delivery_guys)
    customer = ask_user_one_of(@customer_repo.all)
    new_order = Order.new( customer: customer, meal: meal, employee: employee )
    @order_repo.add(new_order)
    list_undelivered_orders
  end

  def list_my_orders(employee)
    orders = @order_repo.undelivered_orders_of(employee)
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repo.undelivered_orders_of(employee)
    order = ask_user_one_of(orders)
    order.deliver!
    @order_repo.save
    @view.display(orders)
  end

  private

  def ask_user_one_of(elements)
    @view.display(elements)
    model_name = elements.first.class.to_s.downcase
    id = @view.ask_user_for("id of #{model_name}").to_i
    elements.find{ |element| element.id == id }
  end
end
