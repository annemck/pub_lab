class Customer
  
  attr_reader :name, :wallet, :age, :drunkenness
  
  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end
  
  def decrease_money_in_wallet(drink)
    @wallet -= drink.price
  end
  
  def customer_buys_drink(customer, pub, drink)
    if (pub.check_customer_age(customer)) && (pub.check_customer_is_drunk(customer) == false)
      if drink.quantity >= 1
        decrease_money_in_wallet(drink)
        pub.increase_money_in_till(drink)
        increase_drunkenness(drink)
        drink.change_quantity(drink)
      end
    end
  end
  
  def increase_drunkenness(drink)
    @drunkenness += drink.abv
  end
  
  def customer_buys_food(customer, pub, food)
    decrease_money_in_wallet(food)
    pub.increase_money_in_till(food)
    eat_food(customer, food)
  end
  
  def eat_food(customer, food)
    @drunkenness -= food.rejuvenation_level
  end

  
end
