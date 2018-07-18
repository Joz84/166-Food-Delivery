class Meal
  attr_accessor :name, :id, :price

  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end

  def headers
    ["id", "name", "price"]
  end

  def to_csv_row
    [@id, @name, @price]
  end
end
