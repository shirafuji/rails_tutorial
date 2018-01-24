require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_url
    assert_response :success
    assert_template "static_pages/home"
    assert_select "a[href = ?]", root_path, count: 2
    assert_select "a[href = ?]", help_url
    assert_select "a[href = ?]", about_path
    assert_select "a[href = ?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get sign_up_path
    assert_select "title", full_title("Sign_up")
  end
end
