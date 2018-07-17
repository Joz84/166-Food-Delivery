class MealsView

  def display_all(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} : #{meal.price} €"
    end
  end

  def ask_user_for(param)
    puts "Choisis un/une #{param}"
    print ">"
    gets.chomp
  end

end
