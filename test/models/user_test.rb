require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
	    @user = User.new(name: 'prueba', email: 'prueba@prueba.com', username: 'prueba', password: '12345678')
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
	    @user.name = ""
	    assert_not @user.valid?
	end

	test "email should be present" do
	    @user.email = ""
	    assert_not @user.valid?
	end

	test "name should not be too long" do
    @user.name = "a" * 81
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 68 + "@red.ujaen.es"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end


end
