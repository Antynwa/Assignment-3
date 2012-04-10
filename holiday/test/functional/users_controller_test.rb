require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_create
    get :create
    assert_select 'form p',:count => 8
  end
end
