class ApplicationController < ActionController::API
  include ActionController::Cookies

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
    errors = ['Not logged in']
    render json: { errors: errors }, status: :unauthorized
    end
end

def logged_in?
#    !session[:user_id].nil?
   session.include? :user_id
end

end
