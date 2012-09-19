module SessionHelper
require 'yahoo_stock'

def find_last_trade symbol
quote = YahooStock::Quote.new(:stock_symbols => [symbol])
result = quote.results(:to_hash).output

@ltp = result.first[:last_trade_price_only]
@ltp
end

def buy_quantity script
if script.buyorsale == 'Buy'
 return script.quantity
else
 return nil
 end
end

def buy_price script
if script.buyorsale == 'Buy'
 return script.user_price
else
 return nil
 end
end

def sell_quantity script
if script.buyorsale == 'Sell'
 return script.quantity
else
 return nil
 end
end

def sell_price script
if script.buyorsale == 'Sell'
 return script.user_price
else
 return nil
 end
end

def profit_loss script
if script.buyorsale == 'Buy'
 return (@ltp.to_d-script.user_price)*script.quantity.to_i
else
 return (script.user_price-@ltp.to_d)*script.quantity.to_i
 end
end

def total_pl my_scripts
temp = 0;
my_scripts.each do |script|
quote = YahooStock::Quote.new(:stock_symbols => [script.script_symbol])
result = quote.results(:to_hash).output
@ltp = result.first[:last_trade_price_only]
if script.buyorsale == 'Buy'
 temp = temp + (@ltp.to_d-script.user_price)*script.quantity.to_i
else
 temp = temp + (script.user_price-@ltp.to_d)*script.quantity.to_i
 end
end
return temp.to_d
end
end
