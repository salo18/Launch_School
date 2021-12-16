# 1
# assert_equal(true, value.odd?)

# 2
# assert_equal("xyz", value.downcase)

# require 'minitest/autorun'
# require 'minitest/reporters'
# MiniTest::Reporters.use!

# class TestEqualityAssertions < Minitest::Test
#   def setup
#     @value = 'XYZ'
#   end

#   def test_downcase
#     assert_equal('xyz', @value.downcase)
#     assert_equal('XYZ', @value.downcase)
#   end
# end

# 3
# assert_equal(nil, value)
# assert_nil value

# require 'minitest/autorun'

# class Test < Minitest::Test
#   def method
#     @value = nil
#   end

#   def test_nil
#     assert_nil(@value)
#   end
# end

# 4
# assert_empty(list)
# assert_equal(true, list.empty?)

# require 'minitest/autorun'

# class Test < Minitest::Test
#   # attr_reader :list
#   def setup
#     @list = []
#   end

#   def test_empty
#     assert_equal(true, @list.empty?)
#     # assert_empty(@list)
#   end
# end

# # 5
# require 'minitest/autorun'

# class Test < Minitest::Test
#   def setup
#     @list = ["xyz"]
#   end

#   def test_include
#     assert_includes(@list, "xyz")
#   end
# end

# 6
# assert_raises(NoExperienceError) { employee.hire }

# require 'minitest/autorun'

# # NoExperienceError = Class.new(StandardError)
# class NoExperienceError < StandardError
# end

# class Employee
#   def hire
#     raise NoExperienceError, "You've got no experience"
#   end
# end

# class Test < Minitest::Test
#   def setup
#     @employee = Employee.new
#   end

#   def test_hire
#     assert_raises(NoExperienceError) { @employee.hire }
#   end
# end

# 7
# assert_instance_of(Numeric, value)

# require 'minitest/autorun'

# class Test < Minitest::Test
#   def setup
#     @value = Numeric.new
#   end

#   def test_numeric
#     assert_instance_of(Numeric, @value)
#   end
# end

# 8
# assert_kind_of(Numeric, value)

# require 'minitest/autorun'

# class Test < Minitest::Test
#   def setup
#     @value = 2
#   end

#   def test_numeric
#     assert_kind_of(Numeric, @value)
#   end
# end

# 9
# assert_same(list, list.process)
# assert_equal(list.object_id, list.process.object_id)

# require 'minitest/autorun'
# class List
#   attr_reader :process
#   def initialize
#     @process = self
#   end
# end

# class Test < Minitest::Test
#   def setup
#     @list = List.new
#   end

#   def test_objects
#     assert_same(@list, @list.process)
#   end
# end

# 10
# refute_includes(list, "xyz")
require 'minitest/autorun'

class Test < Minitest::Test
  def setup
    @list = ["xyza"]
  end

  def test_includes
    refute_includes(@list, "xyz")
  end
end