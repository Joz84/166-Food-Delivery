require "csv"
require_relative "../models/meal"

class MealRepository

  def initialize(csv_file)
    # fail Exception, "Unvalid File!" if File.exist?(csv_file)
    @csv_file = csv_file
    @meals = []
    load_csv if File.exist?(csv_file)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def find(id)
    @meals.find{ |meal| meal.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end
  end


end
