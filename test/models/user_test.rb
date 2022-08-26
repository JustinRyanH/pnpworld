require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the email is required" do
    new_user = User.new()
    refute new_user.valid?, "user requires a username"
    assert_not_nil new_user.errors[:name], "raises an name error"
  end

  test "the email is unique" do
    existing_user = users(:other)
    assert_equal(existing_user.email, "other@example.com")
    new_user = User.new(email: "other@example.com")
    refute new_user.valid?, "User email cannot be duplicated"
  end
end
