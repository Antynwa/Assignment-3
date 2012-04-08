require File.dirname(__FILE__) + "/../test_helper"

class UsersControllerTest < ActionController::TestCase
  def test_user_create
    get :create, :id => 10
    assert_equal nil, flash[:notice]  
  end
end
