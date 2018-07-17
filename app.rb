require_relative "router"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"

meals_file = "data/meals.csv"
meal_repo = MealRepository.new(meals_file)
meals_controller = MealsController.new(meal_repo)

router = Router.new(meals_controller)
router.run
