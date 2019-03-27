class Drink
  
  attr_reader :name, :price, :abv
  attr_accessor :quantity
  
  def initialize(name, price, abv, quantity)
    @name = name
    @price = price
    @abv = abv
    @quantity = quantity
  end
  
  def change_quantity(drink)
    drink.quantity -= 1
  end
end
