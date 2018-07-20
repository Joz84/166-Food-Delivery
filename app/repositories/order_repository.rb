require_relative "../models/order"
require_relative "base_repository"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repo, employee_repo, customer_repo)
    @meal_repo = meal_repo
    @employee_repo = employee_repo
    @customer_repo = customer_repo
    super(csv_file)
  end

  def build_element(row)

    row[:id] = row[:id].to_i
    row[:delivered] = ( row[:delivered] == "true" )
    meal_id = row[:meal_id].to_i
    meal = @meal_repo.find(meal_id)

    employee_id = row[:employee_id].to_i
    employee = @employee_repo.find(employee_id)

    customer_id = row[:customer_id].to_i
    customer = @customer_repo.find(customer_id)

    order = Order.new(row)
    order.meal = meal
    order.customer = customer
    order.employee = employee
    return order
  end

  def undelivered_orders
    @elements.select { |order| !order.delivered? }
  end

  def undelivered_orders_of(employee)
    @elements.select { |order| !order.delivered? && order.employee == employee }
  end

end
