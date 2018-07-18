class Customer
  attr_accessor :name, :id, :address

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end

  def headers
    ["id", "name", "address"]
  end

  def to_csv_row
    [ @id, @name, @address ]
  end
end
