class SessionController < ApplicationController
  def new
  end
  def create
    giraffe = Giraffe.find_by :email => params[:email]
    # raise "gchje"
    if giraffe.present? && giraffe.authenticate(params[:password])
    session[:giraffe_id] = giraffe.id
    redirect_to giraffes_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:giraffe_id] = nil
    redirect_to root_path
  end
end
