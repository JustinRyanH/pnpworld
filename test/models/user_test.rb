require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the email is required" do
    new_user = User.new()
    refute new_user.valid?, "user requires a username"
    assert_not_nil new_user.errors[:name], "raises an name error"
  end
end
