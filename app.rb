require_relative "router"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/order_repository"

require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"
require_relative "app/controllers/orders_controller"


meals_file = "data/meals.csv"
meal_repo = MealRepository.new(meals_file)
meals_controller = MealsController.new(meal_repo)

customers_file = "data/customers.csv"
customer_repo = CustomerRepository.new(customers_file)
customers_controller = CustomersController.new(customer_repo)

employee_file = "data/employees.csv"
employee_repo = EmployeeRepository.new(employee_file)
sessions_controller = SessionsController.new(employee_repo)

orders_file = "data/orders.csv"
order_repo = OrderRepository.new(orders_file, meal_repo, employee_repo, customer_repo)
orders_controller = OrdersController.new(order_repo, meal_repo, employee_repo, customer_repo)


router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run
