# 1
# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# 2
# class Person
#   attr_accessor :first_name, :last_name
#   def initialize(full_name)
#     arr = full_name.split
#     @first_name = arr.first
#     @last_name = arr.size > 1 ? arr.last : ""
#   end

#   def name
#     p "#{first_name} #{last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# 3
class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
  def to_s
    name
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

# 4
# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# p bob.name == rob.name

# 5
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
# this outputs the class because we are just calling the class.