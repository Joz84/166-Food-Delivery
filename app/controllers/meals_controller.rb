require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealsView.new
  end

  def list
    meals = @meal_repo.all
    @view.display_all(meals)
  end

  def add
    name = @view.ask_user_for(:name)
    price = @view.ask_user_for(:price)
    meal = Meal.new(name: name, price: price)
    @meal_repo.add(meal)
    list
  end

end
