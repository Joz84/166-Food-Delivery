class Meal
  attr_accessor :name, :id, :price

  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end
end
