require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  # def test_accept_money
  #   register = CashRegister.new(100)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 20

  #   previous = register.total_money
  #   register.accept_money(transaction)
  #   current = register.total_money

  #   assert_equal(previous + 20, current)
  # end

  # def test_change
  #   register = CashRegister.new(100)
  #   transaction = Transaction.new(30)
  #   transaction.amount_paid = 40

  #   assert_equal(10, register.change(transaction))
  # end

  # def test_give_receipt
  #   register = CashRegister.new(100)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 20

  #   assert_output("You've paid $20.\n") { register.give_receipt(transaction) }
  # end
end