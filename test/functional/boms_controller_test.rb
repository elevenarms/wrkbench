require 'test_helper'

class BomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bom" do
    assert_difference('Bom.count') do
      post :create, :bom => { }
    end

    assert_redirected_to bom_path(assigns(:bom))
  end

  test "should show bom" do
    get :show, :id => boms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => boms(:one).to_param
    assert_response :success
  end

  test "should update bom" do
    put :update, :id => boms(:one).to_param, :bom => { }
    assert_redirected_to bom_path(assigns(:bom))
  end

  test "should destroy bom" do
    assert_difference('Bom.count', -1) do
      delete :destroy, :id => boms(:one).to_param
    end

    assert_redirected_to boms_path
  end
end
