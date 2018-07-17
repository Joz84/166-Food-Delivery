require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"

concombre = Meal.new(name: "Tarte aux concombres", price: 15)

meal_file = "data/meals.csv"
meal_repo = MealRepository.new(meal_file)
meal_repo.add(concombre)

p meal_repo.all
p meal_repo.find(2)
