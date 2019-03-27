require('minitest/autorun')
require('minitest/rg')
require_relative('../drinks.rb')


class TestDrinks < MiniTest::Test
  
  def setup
    @drink = Drink.new("Tennants", 3.50, 3, 10)
  end
  
  def test_drink_has_name
    assert_equal(@drink.name, "Tennants")
  end
  
  def test_drink_has_price
    assert_equal(3.50, @drink.price)
  end
  
  def test_drink_has_abv
    assert_equal(3, @drink.abv)
  end
  
  def test_drink_has_quantity
    assert_equal(10, @drink.quantity)
  end
  
  def test_change_quantity
    @drink.change_quantity(@drink)
    assert_equal(9, @drink.quantity)
  end
  
end
