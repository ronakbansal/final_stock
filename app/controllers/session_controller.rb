class SessionController < ApplicationController
 require 'rubygems'
require 'yahoo_stock'

  def index
  end
def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
	welcome
  end
end
def destroy
  session[:user_id] = nil
  redirect_to root_url
end
  def welcome
  @my_scripts = Portfolio.find(:all, :conditions => [ "user_id = ?", current_user.id])
  unless params[:search].blank?
   @search_term = params[:search]
   @symbol = YahooStock::ScripSymbol.new(@search_term)
   @results = @symbol.results(:to_hash).output
  end
  if request.xhr?
        render :json => @results
    else
  render "welcome"
  end
  end
  def add_to_portfolio
@add_to_table = Portfolio.create(:user_id => current_user.id, :script_symbol => params[:script_symbol], :quantity => params[:quantity], :user_price => params[:user_price],:buyorsale => params[:buyorsale])
render :nothing => true
end
end