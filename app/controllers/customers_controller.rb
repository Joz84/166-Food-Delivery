require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomerView.new
  end

  def list
    customers = @customer_repo.all
    @view.display(customers)
  end

  def add
    name = @view.ask_user_for(:name)
    address = @view.ask_user_for(:address)
    customer = Customer.new(name: name, address: address)
    @customer_repo.add(customer)
    list
  end
end
