class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct.
  #   if user && user.authenticate(params[:password])
  #     # Save the user id inside the browser cookie.
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #   # If user's login doesn't work, send them back to the login form.
  #     redirect_to '/sessions/new'
  #   end
  # end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end