require File.join( File.dirname(__FILE__), '..', 'test_helper' )

class TryRequireTest < Test::Unit::TestCase

  def test_require_something_from_ruby_core
    assert_equal true, try_require('net/http')
    assert_nothing_raised { self.class.instance_eval('include Net') }
    assert_nothing_raised { h=HTTP }

    assert_equal false, try_require('net/http'), "Requiring something that's already loaded must return false"
  end

  # This test assumes rake is installed for the 
  # This may not be the best test for running the tests on new Ruby interpreters.
  # Other ideas?
  def test_require_a_very_popular_gem
    assert_equal true, try_require('rake')
    v=nil
    assert_nothing_raised { v = RAKEVERSION }
    assert_kind_of String, v
  end

  def test_require_a_non_existent_gem
    assert_nothing_raised { try_require("non_existent_gem_#{ rand(1_000_000) }") }
  end

end
