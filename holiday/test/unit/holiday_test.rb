require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def new_holiday(attributes = {})
     attributes[:dateleaving] ||= '10/10/2012'
     attributes[:daterturning] ||= '09/09/2012'
     attributes[:user_id] ||= 5
     attributes[:comments] ||= 'abc123'
     holiday = User.new(attributes)
     holiday
   end
    def test_holiday_should_not_be_approved 
      assert_equal false, holidays(:one).approved
    end
    def test_holiday_should_be_approved 
      assert_equal true, holidays(:two).approved
    end
    def test_holiday_should_have_one_id
      assert_equal 20, holidays(:one).id
    end
    def test_holiday_should_have_comments
      assert_match 'MyString', holidays(:one).comments
    end
    def dateleaving_must_not_be_blank
      assert new_holiday(:dateleaving => '').errors.on(:dateleaving)
    end
     def datereturning
        assert new_holiday(:datereturning => '').errors.on(:datereturning)
      end
    
    
end

