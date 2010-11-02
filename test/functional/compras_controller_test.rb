require 'test_helper'

class ComprasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compra" do
    assert_difference('Compra.count') do
      post :create, :compra => { }
    end

    assert_redirected_to compra_path(assigns(:compra))
  end

  test "should show compra" do
    get :show, :id => compras(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => compras(:one).to_param
    assert_response :success
  end

  test "should update compra" do
    put :update, :id => compras(:one).to_param, :compra => { }
    assert_redirected_to compra_path(assigns(:compra))
  end

  test "should destroy compra" do
    assert_difference('Compra.count', -1) do
      delete :destroy, :id => compras(:one).to_param
    end

    assert_redirected_to compras_path
  end
end
