require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  setup do
    @estimate = estimates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimate" do
    assert_difference('Estimate.count') do
      post :create, estimate: { estimate_id: @estimate.estimate_id, shingle_quantity: @estimate.shingle_quantity, shingle_type: @estimate.shingle_type }
    end

    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should show estimate" do
    get :show, id: @estimate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimate
    assert_response :success
  end

  test "should update estimate" do
    put :update, id: @estimate, estimate: { estimate_id: @estimate.estimate_id, shingle_quantity: @estimate.shingle_quantity, shingle_type: @estimate.shingle_type }
    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should destroy estimate" do
    assert_difference('Estimate.count', -1) do
      delete :destroy, id: @estimate
    end

    assert_redirected_to estimates_path
  end
end
