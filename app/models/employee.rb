class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] || 'delivery_guy'
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def headers
    ["id", "username", "password", "role"]
  end

  def to_csv_row
    [ @id, @username, @password, @role ]
  end

  def attributes
    { id: @id, username: @username }
  end
end
