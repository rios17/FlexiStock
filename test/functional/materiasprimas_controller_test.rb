require 'test_helper'

class MateriasprimasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materiasprimas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materiasprima" do
    assert_difference('Materiasprima.count') do
      post :create, :materiasprima => { }
    end

    assert_redirected_to materiasprima_path(assigns(:materiasprima))
  end

  test "should show materiasprima" do
    get :show, :id => materiasprimas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => materiasprimas(:one).to_param
    assert_response :success
  end

  test "should update materiasprima" do
    put :update, :id => materiasprimas(:one).to_param, :materiasprima => { }
    assert_redirected_to materiasprima_path(assigns(:materiasprima))
  end

  test "should destroy materiasprima" do
    assert_difference('Materiasprima.count', -1) do
      delete :destroy, :id => materiasprimas(:one).to_param
    end

    assert_redirected_to materiasprimas_path
  end
end
