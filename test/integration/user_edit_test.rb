require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    def setup
	@user = users(:sumit)
    end
   test "unsuccessful edit" do
	get edit_user_path(@user)
	assert_template 'users/edit'
	patch user_path(@user), user: {name: "", email: "foo@invalid.com", password:   "foo", password_confirmation: "foo"}
	assert_template 'user/edit'
   end
end
