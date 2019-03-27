class Pub
  
  attr_reader :name, :till
  attr_accessor :drink_stock, :drink_menu
  def initialize(name, till, drink_menu, drink_stock)
  @name = name
  @till = till
  @drink_menu = drink_menu
  @drink_stock = drink_stock
end

def increase_money_in_till(drink)
  @till += drink.price
end

def check_customer_age(customer)
  customer.age >= 18
end

def check_customer_is_drunk(customer)
  customer.drunkenness >= 8
end

def stock_by_drink(drink)
  name = drink.name
  @drink_stock[name]
end

def stock_value_single_drink(drink)
  stock_by_drink(drink) * drink.price
end

def stock_value
  total = 0
  @drink_stock.each do |name, quantity|
    
    total += (quantity * @drink_menu[name])
  end
  return total
end


end
