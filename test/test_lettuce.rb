require 'test/unit'
require 'lettuce'

class LettuceTest < Test::Unit::TestCase

  def test_bad_url
    assert_equal [], Lettuce.parse_url("this is not a url")
  end
  
  def test_no_url
    assert_equal [], Lettuce.parse_url(nil)
  end
  
  def test_url_with_no_hrecipe
    assert_equal [], Lettuce.parse_url("http://github.com/tmrudick/lettuce")
  end
  
  def test_foodtv
    recipe = Lettuce.parse_url("fixtures/asparagus.html")
    
    assert_equal "Roasted Asparagus", recipe.fn
    assert_equal 5, recipe.ingredients.size
    assert_equal "http://img.foodnetwork.com/FOOD/2009/01/13/vday_roastedasparagus4854_s4x3_med.jpg", recipe.photo
  end
end