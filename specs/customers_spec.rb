require('minitest/autorun')
require('minitest/rg')
require_relative('../customers.rb')
require_relative('../drinks.rb')
require_relative('../pub.rb')
require_relative('../food.rb')

class TestCustomer < MiniTest::Test
  
  def setup
    @customer = Customer.new("Tam", 50.00, 82)
    @customer2 = Customer.new("Wee Tam", 20.00, 17)
    @drink = Drink.new("Tennants", 3.50, 3, 10)
    @pub = Pub.new("The Dead Swan", 100.00, @drink_menu, @drink_stock)
    @food = Food.new("Burger", 10.00, 2)
  end
  
  def test_customer_has_name
    assert_equal("Tam", @customer.name)
  end
  
  def test_customer_has_wallet
    assert_equal(50, @customer.wallet)
  end
  
  def test_decrease_money_in_wallet
    @customer.decrease_money_in_wallet(@drink)
    assert_equal(46.50, @customer.wallet)
  end
  
  def test_customer_buys_drink
    @customer.customer_buys_drink(@customer, @pub, @drink)
    assert_equal(46.50, @customer.wallet)
    assert_equal(103.50, @pub.till)
    assert_equal(3, @customer.drunkenness)
    assert_equal(9, @drink.quantity)
  end
  
  def test_customer_underage
    @customer2.customer_buys_drink(@customer2, @pub, @drink)
    assert_equal(20.00, @customer2.wallet)
    assert_equal(100.00, @pub.till)
    assert_equal(0, @customer2.drunkenness)
  end
  
  def test_customer_has_age
    assert_equal(82, @customer.age)
  end
  
  def test_customer_drunkenness_level
    assert_equal(0, @customer.drunkenness)
  end
  
  def test_increase_drunkenness
    @customer.increase_drunkenness(@drink)
    assert_equal(3, @customer.drunkenness)
  end
  
  def test_customer_too_drunk
    3.times do @customer.customer_buys_drink(@customer, @pub, @drink)
    end
    assert_nil(@customer.customer_buys_drink(@customer, @pub, @drink))
  end
  
  def test_customer_buys_food
    @customer.customer_buys_food(@customer, @pub, @food)
    assert_equal(40.00, @customer.wallet)
    assert_equal(110.00, @pub.till)
    assert_equal(-2, @customer.drunkenness)
  end
  
  def test_food_rejuvenates_customer
    @customer.eat_food(@customer, @food)
    assert_equal(-2, @customer.drunkenness)
  end
  
end
