# encoding: UTF-8
require 'test_helper'

class MovementsControllerTest < ActionController::TestCase
  setup do
    @movement = movements(:one)
    @update = {
      :flow => Movement::FLOWS.first, 
      :value => 84.65, 
      :date => "01/01/2011",
      :observation => "Observação",
      :account => Account.first
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movement" do
    assert_difference('Movement.count') do
      post :create, :movement => @update
    end

    assert_redirected_to movements_path
  end

  test "should get edit" do
    get :edit, :id => @movement.to_param
    assert_response :success
  end

  test "should update movement" do
    put :update, :id => @movement.to_param, :movement => @update
    assert_redirected_to movements_path
  end

  test "should destroy movement" do
    assert_difference('Movement.count', -1) do
      delete :destroy, :id => @movement.to_param
    end

    assert_redirected_to movements_path
  end
end
