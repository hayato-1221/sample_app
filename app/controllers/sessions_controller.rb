class SessionsController < ApplicationController

  # GET /login
  def new
    # scope: :session + url: login_path
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Success
      log_in user
      redirect_to user
    else
      # Failure
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  # DELETE /logout
  def destroy
    log_out
    redirect_to root_url
  end
end