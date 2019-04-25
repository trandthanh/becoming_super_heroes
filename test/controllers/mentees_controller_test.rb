require 'test_helper'

class MenteesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mentees_new_url
    assert_response :success
  end

  test "should get create" do
    get mentees_create_url
    assert_response :success
  end

end
