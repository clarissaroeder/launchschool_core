require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(5)
    transaction.amount_paid = 5

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 5, current_amount
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(5)
    transaction.amount_paid = 20

    assert_equal 15, register.change(transaction)
  end

  def test_give_receipt
    item_cost = 5
    register = CashRegister.new(100)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") { register.give_receipt(transaction) }
  end
end