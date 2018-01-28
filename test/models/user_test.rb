require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
def setup
  @user = User.new(name: "Yu", email: "aaa@aaa", password: "foobar", password_confirmation: "foobar")
end

  test "should be valid" do
    assert @user.valid?
  end
  test "length of name should be appropriate" do
    @user.email = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    assert_not @user.valid?
  end
  test "email should have valid format" do
    @user.email = "aaa"
    assert_not @user.valid?
  end
  test "users should be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
  test "email should be downcase" do
    @user.email = "AAA@aaa"
    @user.save
    assert_equal @user.email, "aaa@aaa"
  end
  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
  test "password should be present" do
    @user.password = @user.password_confirmation = ""*7
    assert_not @user.valid?
  end

end
