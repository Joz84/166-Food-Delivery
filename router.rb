class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = ask_choice.to_i
      set_action(action)
    end
  end

  def display_menu
    puts "------------------"
    puts "----- MENU -------"
    puts "------------------"

    puts " 1 : Afficher la liste des menus"
    puts " 2 : Ajouter un menu à la liste"
    puts " 0 : Quit"
  end

  def ask_choice
    puts "Choisis une action"
    print ">"
    gets.chomp
  end

  def set_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 0
      puts "The End"
      @running = false
    end
  end

end
