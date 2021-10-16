# # 1
# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end
# # ben is right... the attr_reader at the top of the code gives us a getter method
# # with which to reference the @balance instance variable without having to use the @
# # attr_reader :balance is def balance; @balance; end so balance on line 10 is
# # a method invocation that returns the value of the @balance instance variable

# 2
# class InvoiceEntry
#   attr_accessor :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     self.quantity = updated_count if updated_count >= 0
#   end
# end

# # 3
# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     self.quantity = updated_count if updated_count >= 0
#   end

#   private

#   attr_writer :quantity
# end

# a = InvoiceEntry.new("blue", 10)

# a.update_quantity(100)
# p a.quantity

# # 4
# class Greet
#   def greet(str)
#     puts str
#   end
# end

# class Hello < Greet
#   def hi
#     greet("hello")
#   end
# end

# class Goodbye < Greet
#   def goodbye
#     greet("goodbye")
#   end
# end

# a = Greet.new
# a.greet("Hey")

# b = Hello.new
# b.hi

# c = Goodbye.new
# c.goodbye

# # 5
# require 'pry'
# class KrispyKreme
#   attr_reader :filling_type, :glazing

#   def initialize(filling_type = "Plain", glazing = "Plain")
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   # def to_s
#   #   if filling_type == nil && glazing == nil
#   #     "Plain"
#   #   elsif glazing == nil
#   #     "#{filling_type}"
#   #   elsif filling_type == nil
#   #     "Plain with #{glazing}"
#   #   else
#   #     "#{filling_type} with #{glazing}"
#   #   end
#   # end

#   def to_s
#     filling_str = filling_type ? filling_type : "Plain"
#     glazing_str = glazing ? " with #{glazing}" : ""
#     filling_str + glazing_str
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   # => "Plain"

# puts donut2
#   # => "Vanilla"

# puts donut3
#   # => "Plain with sugar"

# puts donut4
#   # => "Plain with chocolate sprinkles"

# puts donut5
#   # => "Custard with icing"

# 6

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# class Computer
#   attr_accessor :template

#   def create_template
#     self.template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end

# # what is the difference in the way the code works?
# cpu = Computer.new
# p cpu.create_template
# p cpu.show_template

# 7
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end