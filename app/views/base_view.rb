class BaseView

  def display(elements)
    elements.each do |element|
      puts element.attributes.map { |k, v| "#{k} : #{v}" }.join(" - ")
    end
  end

  def ask_user_for(param)
    puts "#{param}?"
    print ">"
    gets.chomp
  end

end
