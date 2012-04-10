class UserTest < ActiveSupport::TestCase
def user_must_be_admin
   assert_match false, users(:now).admin
 end
end
	