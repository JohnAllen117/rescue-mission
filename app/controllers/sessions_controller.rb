class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    binding.pry
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in."
  end
end