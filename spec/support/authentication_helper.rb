module AuthenticationHelper
  def sign_in(user)
    request.session[:user] = user.id
  end
end
