require File.dirname(__FILE__) + "/../test_helper"

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_post_should_have_id
    assert_equal 1, posts(:one).id
  end
  def test_post_should_have_user
    assert_equal 5, posts(:one).user_id
  end
end
