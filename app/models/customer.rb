class Customer
  attr_accessor :name, :id, :address

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end
end
