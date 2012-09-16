module SessionHelper
require 'yahoo_stock'

def find_last_trade symbol
quote = YahooStock::Quote.new(:stock_symbols => [symbol])
result = quote.results(:to_hash).output
result.first[:last_trade_price_only]
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

end
