require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < MiniTest::Test
  
  def setup
    @food = Food.new("Burger", 10.00, 2)
  end
  
  def test_food_has_name
    assert_equal("Burger", @food.name)
  end
  
  def test_food_has_price
    assert_equal(10.00, @food.price)
  end
  
  def test_food_has_rejuvenation_level
    assert_equal(2, @food.rejuvenation_level)
  end
  
end
