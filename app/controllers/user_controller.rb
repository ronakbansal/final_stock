class UserController < ApplicationController
def create
  @user = User.create("email" => params[:email], "password" => params[:password], "password_confirmation" => params[:password_confirmation])
  render :nothing => true
end
end
