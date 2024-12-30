# account_test.rb
require 'minitest/autorun'
require_relative '../account'

class AccountTest < Minitest::Test
  def setup
    Account.class_variable_set(:@@customers,{})
    @customer1 = Account.new('shiva', 1000, 123456789012)
    @customer2 = Account.new('ram', 2000, 123456789013)
  end

  def test_account_creation
    assert_equal 'shiva', @customer1.name
    assert_equal 1000, @customer1.balance
    assert_match /^AC200403\d+$/, @customer1.account_number
  end

  def test_initial_balance
    assert_equal 2000, @customer2.balance
  end

  def test_get_customer
    assert_equal({'name' => 'shiva', 'aadhar' => 123456789012, 'balance' => 1000}, Account.get_customer(@customer1.account_number))
  end

  def test_get_not_exist_customer
    assert_nil Account.get_customer('AC0000000')
  end

  def test_get_customer_all
    all_customers = Account.get_customer_all
    assert_equal 2, all_customers.length
    assert_equal 'shiva', all_customers[@customer1.account_number]['name']
    assert_equal 'ram', all_customers[@customer2.account_number]['name']
  end

end
