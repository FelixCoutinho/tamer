# encoding: UTF-8
require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
    @update = {
      :name => "Conta Poupança",
      :opening_balance => 456.54
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
    assert_select 'a', 'Adicionar'
    assert_select '#tableSortAccounts thead tr .header', :minimum => 3
    assert_select '#tableSortAccounts tbody tr', :minimum => 2, :maximum => 2
    assert_select 'div .page-header h1', 'Contas'
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'div .page-header h1', 'Nova Conta'
    assert_select 'div .page-header h1', 'Nova Conta'
    assert_select 'form .clearfix label', :minimum => 2, :maximum => 2
    assert_select 'form .clearfix input', :minimum => 2, :maximum => 2
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, :account => @update
    end
    assert_redirected_to accounts_path
  end

  test "should get edit" do
    get :edit, :id => @account.to_param
    assert_response :success
  end

  test "should update account" do
    put :update, :id => @account.to_param, :account => @update
    assert_redirected_to accounts_path
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, :id => @account.to_param
    end

    assert_redirected_to accounts_path
  end
end
