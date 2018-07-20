class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.sign_in
    while @running
      if @employee.manager?
        display_manager_menu
        action = ask_choice.to_i
        set_manager_action(action)
      elsif @employee.delivery_guy?
        display_delivery_guy_menu
        action = ask_choice.to_i
        set_delivery_guy_action(action)
      end
    end
  end

  def display_manager_menu
    puts "------------------"
    puts "----- MENU -------"
    puts "------------------"

    puts " 1 : List meals"
    puts " 2 : Add a meal"
    puts " 3 : List customers"
    puts " 4 : Add a customer"
    puts " 5 : List undelivered orders"
    puts " 6 : Add an order"
    puts " 0 : Quit"
  end

  def set_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 0
      puts "The End"
      @running = false
    end
  end

  def display_delivery_guy_menu
    puts "------------------"
    puts "----- MENU -------"
    puts "------------------"

    puts " 1 : List employee undelivered orders"
    puts " 2 : Mark order as done"
    puts " 0 : Quit"
  end

  def set_delivery_guy_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 0
      puts "The End"
      @running = false
    end
  end

  def ask_choice
    puts "Choise an action"
    print ">"
    gets.chomp
  end

end
