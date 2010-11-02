require 'test_helper'

class TiposMovimientosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_movimiento" do
    assert_difference('TiposMovimiento.count') do
      post :create, :tipos_movimiento => { }
    end

    assert_redirected_to tipos_movimiento_path(assigns(:tipos_movimiento))
  end

  test "should show tipos_movimiento" do
    get :show, :id => tipos_movimientos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipos_movimientos(:one).to_param
    assert_response :success
  end

  test "should update tipos_movimiento" do
    put :update, :id => tipos_movimientos(:one).to_param, :tipos_movimiento => { }
    assert_redirected_to tipos_movimiento_path(assigns(:tipos_movimiento))
  end

  test "should destroy tipos_movimiento" do
    assert_difference('TiposMovimiento.count', -1) do
      delete :destroy, :id => tipos_movimientos(:one).to_param
    end

    assert_redirected_to tipos_movimientos_path
  end
end
