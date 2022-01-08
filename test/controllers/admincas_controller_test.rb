require "test_helper"

class AdmincasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminca = admincas(:one)
  end

  test "should get index" do
    get admincas_url
    assert_response :success
  end

  test "should get new" do
    get new_adminca_url
    assert_response :success
  end

  test "should create adminca" do
    assert_difference('Adminca.count') do
      post admincas_url, params: { adminca: {  } }
    end

    assert_redirected_to adminca_url(Adminca.last)
  end

  test "should show adminca" do
    get adminca_url(@adminca)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminca_url(@adminca)
    assert_response :success
  end

  test "should update adminca" do
    patch adminca_url(@adminca), params: { adminca: {  } }
    assert_redirected_to adminca_url(@adminca)
  end

  test "should destroy adminca" do
    assert_difference('Adminca.count', -1) do
      delete adminca_url(@adminca)
    end

    assert_redirected_to admincas_url
  end
end
