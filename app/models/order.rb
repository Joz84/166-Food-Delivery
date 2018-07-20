class Order
  attr_accessor :id
  attr_accessor :employee, :meal, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @customer = attributes[:customer]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def headers
    [ "id", "delivered", "customer_id", "meal_id", "employee_id" ]
  end

  def to_csv_row
    [ @id, delivered?, @customer.id, @meal.id, @employee.id ]
  end

  def attributes
    { id: @id,
      delivered: delivered?,
      customer_name: @customer.name,
      meal_name: @meal.name,
      employee_username: @employee.username }
  end

end
