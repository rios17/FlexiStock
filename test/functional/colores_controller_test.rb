require 'test_helper'

class ColoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color" do
    assert_difference('Color.count') do
      post :create, :color => { }
    end

    assert_redirected_to color_path(assigns(:color))
  end

  test "should show color" do
    get :show, :id => colores(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => colores(:one).to_param
    assert_response :success
  end

  test "should update color" do
    put :update, :id => colores(:one).to_param, :color => { }
    assert_redirected_to color_path(assigns(:color))
  end

  test "should destroy color" do
    assert_difference('Color.count', -1) do
      delete :destroy, :id => colores(:one).to_param
    end

    assert_redirected_to colores_path
  end
end
