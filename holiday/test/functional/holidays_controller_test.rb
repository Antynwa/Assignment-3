require File.dirname(__FILE__) + "/../test_helper"

class HolidaysControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_should_count_form
    get :new
    assert_select 'form p', :count => 0
    # #This is true because there is no user logged in
  end
  def test_should_show
    get :show, :id => 10 
    assert_template ""
  end
  def test_should_edit
    get :update, :id => 10 
    assert_equal "Holiday updated!", flash[:notice]  
    end
  def test_should_destroy
    get :destroy, :id => 10
    assert_equal "Holiday Deleted" , flash[:notice]
  def test_should_create
      get :create, :id => 10
      assert_equal " New Holiday Created!", flash[:notice]
    end
  end
end
  