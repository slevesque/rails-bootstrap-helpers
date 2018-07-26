require 'test_helper'

class BaseTest < Test::Unit::TestCase
  def setup

  end

  def test_fa_icon_with_no_text
    result = fa_icon(:pencil)
    assert_equal "<span class=\"fa fa-pencil\"></span>", result
  end
  
  def test_fa_icon_with_test
    result = fa_icon(:pencil, text: "FooBar")
    assert_equal "<span><span class=\"fa fa-pencil\"></span> FooBar</span>",
      result
  end
end
