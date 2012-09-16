class Portfolio < ActiveRecord::Base
  attr_accessible :buyorsale, :quantity, :script_symbol, :user_id, :user_price
end
