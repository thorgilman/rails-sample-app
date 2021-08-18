require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "",
                                         password: "",
                                         password_confirmation: "" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      # Post will not follow redirect
      post users_path, params: { user: { name: "Thor Gilman",
                                         email: "thor@askthemis.com",
                                         password: "my_password",
                                         password_confirmation: "my_password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

end
