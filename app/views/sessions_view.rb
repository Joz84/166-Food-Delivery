require_relative "base_view"

class SessionsView < BaseView
  def welcome
    puts "welcome"
  end

  def error_sign_in
    puts "Bad username"
  end

end
