class OrdersView
    def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} - #{order.employee.username} #{order.customer.name} #{order.delivered?}"
    end
  end
end
