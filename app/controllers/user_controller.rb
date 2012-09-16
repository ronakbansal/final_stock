class UserController < ApplicationController
def create
  @user = User.new("email" => params[:email], "password" => params[:password], "password_confirmation" => params[:password_confirmation])
  if @user.save
    redirect_to root_url
  else
      redirect_to root_url

  end
end
end
