require 'test_helper'

class MovimientosInventariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_inventarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimientos_inventario" do
    assert_difference('MovimientosInventario.count') do
      post :create, :movimientos_inventario => { }
    end

    assert_redirected_to movimientos_inventario_path(assigns(:movimientos_inventario))
  end

  test "should show movimientos_inventario" do
    get :show, :id => movimientos_inventarios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => movimientos_inventarios(:one).to_param
    assert_response :success
  end

  test "should update movimientos_inventario" do
    put :update, :id => movimientos_inventarios(:one).to_param, :movimientos_inventario => { }
    assert_redirected_to movimientos_inventario_path(assigns(:movimientos_inventario))
  end

  test "should destroy movimientos_inventario" do
    assert_difference('MovimientosInventario.count', -1) do
      delete :destroy, :id => movimientos_inventarios(:one).to_param
    end

    assert_redirected_to movimientos_inventarios_path
  end
end
