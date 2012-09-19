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
 
	render "welcome"
  end
  def find_possible_scripts
   @search_term = params[:search]
   @symbol = YahooStock::ScripSymbol.new(@search_term)
   @results = @symbol.results(:to_hash).output
   render :partial => "find_possible_scripts"
  end
  
  def add_to_portfolio
@add_to_table = Portfolio.create(:user_id => current_user.id, :script_symbol => params[:script_symbol], :quantity => params[:quantity], :user_price => params[:user_price],:buyorsale => params[:buyorsale])
render :nothing => true
end
  
  def destroy_stock
    @stock = Portfolio.find(:all, :conditions => [ "id = ?", params[:car]])
    @stock.each do |stock|
	stock.destroy
	end
    redirect_to :action => 'welcome'
  end
end
