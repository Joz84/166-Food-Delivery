require "csv"
require_relative "../models/customer"

class CustomerRepository

  def initialize(csv_file)
    # fail Exception, "Unvalid File!" if File.exist?(csv_file)
    @csv_file = csv_file
    @customers = []
    load_csv if File.exist?(csv_file)
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  def find(id)
    @customers.find{ |customer| customer.id == id }
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, options) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
  end
end
