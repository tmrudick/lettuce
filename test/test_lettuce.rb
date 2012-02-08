require 'test/unit'
require 'lettuce'
require File.join(File.dirname(File.absolute_path(__FILE__)),'helper')

class LettuceTest < Test::Unit::TestCase

  def test_bad_url
    assert_equal [], Lettuce.parse_url("this is not a url")
  end
  
  def test_no_url
    assert_equal [], Lettuce.parse_url(nil)
  end
  
  def test_url_with_no_hrecipe
    assert_equal [], Lettuce.parse_url("http://www.tomrudick.com")
  end
  
  def test_foodtv
    recipes = Lettuce.parse_url(html_test_filename("asparagus.html"))
    
    assert_equal 1, recipes.size
    assert_equal "Roasted Asparagus", recipes[0].fn
    assert_equal 5, recipes[0].ingredients.size
    assert_equal "http://img.foodnetwork.com/FOOD/2009/01/13/vday_roastedasparagus4854_s4x3_med.jpg", recipes[0].photo
  end
  
  def test_allrecipes
    recipes = Lettuce.parse_url(html_test_filename("baked_panne.html"))
    
    assert_equal 1, recipes.size
    assert_equal "Baked Penne", recipes[0].fn
    assert_equal 7, recipes[0].ingredients.size
    assert_equal "http://images.media-allrecipes.com/global/recipes/small/216865.jpg", recipes[0].photo
  end
end