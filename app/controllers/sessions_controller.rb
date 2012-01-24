# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Login erfolgreich"
    else
      flash[:error] = "Login fehlgeschlagen, bitte Eingabe checken."
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logout erfolgreich"
  end

end
