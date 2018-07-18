require_relative "router"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"

meals_file = "data/meals.csv"
meal_repo = MealRepository.new(meals_file)
meals_controller = MealsController.new(meal_repo)

customers_file = "data/customers.csv"
customer_repo = CustomerRepository.new(customers_file)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)
router.run
