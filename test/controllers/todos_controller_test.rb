require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get todos_create_url
    assert_response :success
  end

  test "should get index" do
    get todos_index_url
    assert_response :success
  end

  test "should get update" do
    get todos_update_url
    assert_response :success
  end

end