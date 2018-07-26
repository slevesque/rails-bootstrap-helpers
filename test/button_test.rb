require 'test_helper'

class ButtonTest < Test::Unit::TestCase

  def test_button_to
    result = bs_button_to("Foo", "/test/path", style: "secondary")
    assert_match(/link_to/, result)
  end
end
