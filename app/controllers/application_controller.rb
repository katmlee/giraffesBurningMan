class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
before_action :fetch_user

private

def fetch_user
  if session[:giraffe_id].present?
    @current_giraffe = Giraffe.find_by :id => session[:giraffe_id]

    session[:giraffe_id] = nil unless @current_giraffe
  end
end

def authorize_user
  redirect_to root_path unless @current_giraffe.present?
end
end
