require 'test_helper'

class LineasProductosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lineas_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lineas_producto" do
    assert_difference('LineasProducto.count') do
      post :create, :lineas_producto => { }
    end

    assert_redirected_to lineas_producto_path(assigns(:lineas_producto))
  end

  test "should show lineas_producto" do
    get :show, :id => lineas_productos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lineas_productos(:one).to_param
    assert_response :success
  end

  test "should update lineas_producto" do
    put :update, :id => lineas_productos(:one).to_param, :lineas_producto => { }
    assert_redirected_to lineas_producto_path(assigns(:lineas_producto))
  end

  test "should destroy lineas_producto" do
    assert_difference('LineasProducto.count', -1) do
      delete :destroy, :id => lineas_productos(:one).to_param
    end

    assert_redirected_to lineas_productos_path
  end
end
