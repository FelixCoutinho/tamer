require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  test "account attributes must not be empty" do
    account = Account.new
    assert account.invalid?
    assert account.errors[:name].any?
    assert account.errors[:opening_balance].any?
  end
  
  test "account name must not be empty" do
    account = Account.new
    assert account.invalid?
    assert_equal "can't be blank" , account.errors[:name].join('; ' )
  end
  
  test "account opening balance must not be empty" do
    account = Account.new
    assert account.invalid?
    assert_equal "is not a number; can't be blank" , account.errors[:opening_balance].join('; ' )
  end  
  
  test "account name must be uniqueness and not case sensitive" do
    account = Account.new
    account.name = "investimentos"
    assert account.invalid?
    assert_equal "has already been taken" , account.errors[:name].join('; ' )
  end
  
  test "account opening balance must be numericality" do
    account = Account.new
    account.opening_balance = "aaa"  
    assert account.invalid?
    assert_equal "is not a number" , account.errors[:opening_balance].join('; ' )
  end
  
end
