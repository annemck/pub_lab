require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customers.rb')


class TestPub < MiniTest::Test
  
  def setup
    
    @customer = Customer.new("Tam", 50.00, 82)
    
    @drink = Drink.new("Tennants", 3.50, 3, 10)
    @drink2 = Drink.new("Buckfast", 2.50, 5, 10)
    @drink3 = Drink.new("Strongbow", 3.00, 4, 10)
    
    @drink_stock = {@drink.name => @drink.quantity, @drink2.name => @drink2.quantity, @drink3.name => @drink.quantity}
    
    @drink_menu = {@drink.name => @drink.price, @drink2.name => @drink2.price, @drink3.name => @drink3.price}
    
    @pub = Pub.new("The Dead Swan", 100.00, @drink_menu, @drink_stock)
    
  end
  
  def test_pub_has_name
    assert_equal("The Dead Swan", @pub.name)
  end
  
  def test_pub_has_till
    assert_equal(100.00, @pub.till)
  end
  
  def test_increase_money_in_till
    # run increase_money_in_till method to buy tennants
    # check the till has went up by the price of tennants
    @pub.increase_money_in_till(@drink)
    assert_equal(103.50, @pub.till)
  end
  
  def test_check_customer_age
    assert_equal(true, @pub.check_customer_age(@customer))
  end
  
  def test_check_customer_is_drunk
    3.times do @customer.customer_buys_drink(@customer, @pub, @drink)
    end
    assert_equal(true, @pub.check_customer_is_drunk(@customer))
  end
  
  def test_check_stock_count_by_drink
    assert_equal(10, @pub.stock_by_drink(@drink))
  end
  
  def test_stock_value_single_drink
    assert_equal(35, @pub.stock_value_single_drink(@drink))
  end
  
  def test_total_stock_value
    assert_equal(90, @pub.stock_value)
  end
  
  
  
end
