require 'test_helper'

class ArticulosClientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articulos_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create articulos_cliente" do
    assert_difference('ArticulosCliente.count') do
      post :create, :articulos_cliente => { }
    end

    assert_redirected_to articulos_cliente_path(assigns(:articulos_cliente))
  end

  test "should show articulos_cliente" do
    get :show, :id => articulos_clientes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => articulos_clientes(:one).to_param
    assert_response :success
  end

  test "should update articulos_cliente" do
    put :update, :id => articulos_clientes(:one).to_param, :articulos_cliente => { }
    assert_redirected_to articulos_cliente_path(assigns(:articulos_cliente))
  end

  test "should destroy articulos_cliente" do
    assert_difference('ArticulosCliente.count', -1) do
      delete :destroy, :id => articulos_clientes(:one).to_param
    end

    assert_redirected_to articulos_clientes_path
  end
end
