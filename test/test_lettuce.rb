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
end