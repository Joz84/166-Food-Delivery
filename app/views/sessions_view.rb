class SessionsView
  def ask_user_for(param)
    puts "#{param}?"
    print ">"
    gets.chomp
  end

  def welcome
    puts "welcome"
  end

  def error_sign_in
    puts "Bad username"
  end

end
