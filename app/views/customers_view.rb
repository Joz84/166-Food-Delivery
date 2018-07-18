class CustomerView

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} : #{customer.address}"
    end
  end

  def ask_user_for(param)
    puts "#{param}?"
    print ">"
    gets.chomp
  end
end
