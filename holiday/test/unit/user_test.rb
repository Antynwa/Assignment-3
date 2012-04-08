require File.dirname(__FILE__) + "/../test_helper"

class UserTest < ActiveSupport::TestCase
  def new_user(attributes = {})
    attributes[:username] ||= 'foo'
    attributes[:email] ||= 'foo@example.com'
    attributes[:fname] ||= 'Neil'
    attributes[:sname] ||= 'Lennon'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    attributes[:admin] ||= true
    user = User.new(attributes)
    user.valid? # run validations
    user
  end

  def setup
    User.delete_all
  end

  def test_valid
    assert new_user.valid?
  end

  def test_require_username
    assert new_user(:username => '').errors.on(:username)
  end

  def test_require_password
    assert new_user(:password => '').errors.on(:password)
  end

  def test_require_well_formed_email
    assert new_user(:email => 'foo@bar@example.com').errors.on(:email)
  end

  def test_validate_uniqueness_of_email
    new_user(:email => 'bar@example.com').save!
    assert new_user(:email => 'bar@example.com').errors.on(:email)
  end

  def test_validate_uniqueness_of_username
    new_user(:username => 'uniquename').save!
    assert new_user(:username => 'uniquename').errors.on(:username)
  end

  def test_validate_odd_characters_in_username
    assert new_user(:username => 'odd ^&(@)').errors.on(:username)
  end

  def test_validate_password_length
    assert new_user(:password => 'bad').errors.on(:password)
  end
  def test_fname_contents
    assert new_user(:fname => '').errors.on(:fname)
  end
  def test_sname_contents
     assert new_user(:sname => '').errors.on(:sname)
   end

  def test_require_matching_password_confirmation
    assert new_user(:password_confirmation => 'nonmatching').errors.on(:password)
  end

  def test_generate_password_hash_and_salt_on_create
    user = new_user
    user.save!
    assert user.password_hash
    assert user.password_salt
  end

  def test_authenticate_by_username
    User.delete_all
    user = new_user(:username => 'foobar', :password => 'secret')
    user.save!
    assert_equal user, User.authenticate('foobar', 'secret')
  end

  def test_authenticate_by_email
    User.delete_all
    user = new_user(:email => 'foo@bar.com', :password => 'secret')
    user.save!
    assert_equal user, User.authenticate('foo@bar.com', 'secret')
  end

  def test_authenticate_bad_username
    assert_nil User.authenticate('nonexisting', 'secret')
  end

  def test_authenticate_bad_password
    User.delete_all
    new_user(:username => 'foobar', :password => 'secret').save!
    assert_nil User.authenticate('foobar', 'badpassword')
  end
  
  def another_user_should_be_admin
    assert new_user(:admin => true).errors.on(:admin)
  
  end
  
  def user_should_be_admin
    assert_equal true, users(:bar).admin
  end
  
  def user_should_not_be_admin
    assert_equal false, users(:foo).admin
  end
end
