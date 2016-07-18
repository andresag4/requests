require 'test_helper'

class ColoniesControllerTest < ActionController::TestCase
  setup do
    @colony = colonies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colonies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colony" do
    assert_difference('Colony.count') do
      post :create, colony: { city_id: @colony.city_id, name: @colony.name, postcode: @colony.postcode }
    end

    assert_redirected_to colony_path(assigns(:colony))
  end

  test "should show colony" do
    get :show, id: @colony
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colony
    assert_response :success
  end

  test "should update colony" do
    patch :update, id: @colony, colony: { city_id: @colony.city_id, name: @colony.name, postcode: @colony.postcode }
    assert_redirected_to colony_path(assigns(:colony))
  end

  test "should destroy colony" do
    assert_difference('Colony.count', -1) do
      delete :destroy, id: @colony
    end

    assert_redirected_to colonies_path
  end
end
