require_relative "../views/sessions_view"

class SessionsController

  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = SessionsView.new
  end

  def sign_in
    username = @view.ask_user_for(:username)
    password = @view.ask_user_for(:password)
    employee = @employee_repo.find_by_username(username)
    if employee && employee.password == password
      @view.welcome
      employee
    else
      @view.error_sign_in
      sign_in
    end
  end

end
