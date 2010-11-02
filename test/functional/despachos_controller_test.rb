require 'test_helper'

class DespachosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:despachos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create despacho" do
    assert_difference('Despacho.count') do
      post :create, :despacho => { }
    end

    assert_redirected_to despacho_path(assigns(:despacho))
  end

  test "should show despacho" do
    get :show, :id => despachos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => despachos(:one).to_param
    assert_response :success
  end

  test "should update despacho" do
    put :update, :id => despachos(:one).to_param, :despacho => { }
    assert_redirected_to despacho_path(assigns(:despacho))
  end

  test "should destroy despacho" do
    assert_difference('Despacho.count', -1) do
      delete :destroy, :id => despachos(:one).to_param
    end

    assert_redirected_to despachos_path
  end
end
