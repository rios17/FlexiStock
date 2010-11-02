require 'test_helper'

class ExistenciasedesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:existenciasedes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create existenciasede" do
    assert_difference('Existenciasede.count') do
      post :create, :existenciasede => { }
    end

    assert_redirected_to existenciasede_path(assigns(:existenciasede))
  end

  test "should show existenciasede" do
    get :show, :id => existenciasedes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => existenciasedes(:one).to_param
    assert_response :success
  end

  test "should update existenciasede" do
    put :update, :id => existenciasedes(:one).to_param, :existenciasede => { }
    assert_redirected_to existenciasede_path(assigns(:existenciasede))
  end

  test "should destroy existenciasede" do
    assert_difference('Existenciasede.count', -1) do
      delete :destroy, :id => existenciasedes(:one).to_param
    end

    assert_redirected_to existenciasedes_path
  end
end
