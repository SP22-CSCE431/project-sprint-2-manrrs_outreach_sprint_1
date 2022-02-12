require "test_helper"

class StudentsImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get students_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get students_imports_create_url
    assert_response :success
  end
end
