require 'test_helper'

class ExistenciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:existencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create existencia" do
    assert_difference('Existencia.count') do
      post :create, :existencia => { }
    end

    assert_redirected_to existencia_path(assigns(:existencia))
  end

  test "should show existencia" do
    get :show, :id => existencias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => existencias(:one).to_param
    assert_response :success
  end

  test "should update existencia" do
    put :update, :id => existencias(:one).to_param, :existencia => { }
    assert_redirected_to existencia_path(assigns(:existencia))
  end

  test "should destroy existencia" do
    assert_difference('Existencia.count', -1) do
      delete :destroy, :id => existencias(:one).to_param
    end

    assert_redirected_to existencias_path
  end
end
