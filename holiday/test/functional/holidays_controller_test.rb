require 'test_helper'

class HolidaysControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_should_count_form
    get :new
    assert_select 'form p', :count => 0
    # #This is true because there is no user logged in
  end
  def test_should_create_holiday
    post :create, :holiday => { :dateleaving => '02/02/2012',
    :datereturning => '03/02/2012', :user_id => '1'}
    assert_redirected_to holiday_path(assigns(:holiday))
    assert_equal 'New Holiday Required', flash[:notice]
    end
  end
  
