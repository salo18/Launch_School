# require 'minitest/autorun'
# # require_relative 'cash_register.rb'
# require_relative 'transaction.rb'

# class TransactionTest < Minitest::Test
#   def test_prompt
#     transaction = Transaction.new(30)
#     input = StringIO.new('30\n')
#     transaction.prompt_for_payment(input)
#     assert_equal(30, transaction.amount_paid)
#   end
# end

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end