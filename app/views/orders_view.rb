class OrdersView
  # def display(orders)
  # orders.each do |order|
  #   puts "#{order.id} - #{order.meal.name} - #{order.employee.username} #{order.customer.name} #{order.delivered?}"
  # end


  def display(orders)
    orders.each do |order|
      puts order.attributes.map { |k, v| "#{k} : #{v}" }.join(" - ")
    end
  end

  def ask_user_for(param)
    puts "#{param}?"
    print ">"
    gets.chomp
  end

end
