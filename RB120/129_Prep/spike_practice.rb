# https://www.notion.so/RB120-92490135331c4fe299a72bb523bc05cb?p=3ffb627b4da34934ab83419cd570cc97

=begin
Design a Sports Team (Author Unknown...thank you!)

#- Include 4 players (attacker, midfielder, defender, goalkeeper)
#- All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
#- All players can run and shoot the ball.
#- Attacker should be able to lob the ball
#- Midfielder should be able to pass the ball
#- Defender should be able to block the ball
#- The referee has a whistle. He wears black and is able to run and whistle.
=end

# module Runnable
#   def run
#   end
# end

# class Player
#  include Runnable

#   def initialize
#     @jersey_color = "blue"
#   end

#   def shoot
#   end
# end

# class Attacker < Player
#   def lob
#   end
# end

# class Midfielder < Player
#   def pass
#   end
# end

# class Defender < Player
#   def block
#   end
# end

# class Goalkeeper < Player
#   @jersey_color = "white with blue stripes"
# end

# class Referee
#   include Runnable
#   def initialize
#     @has_whistle = true
#     @jersey_color = "white with blue stripes"
#   end

#   def whistle
#   end
# end


=begin
Preschool (by Natalie Thompson)

# Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers.
# Both teachers and assistants can help a student with schoolwork and watch them on the playground.
# A teacher teaches
# assistant helps kids with any bathroom emergencies.
# Kids themselves can learn and play.
# A teacher and principle can supervise a class.
# Only the principle has the ability to expel a kid.
# Janitors have the ability to clean.
# Cafeteria workers have the ability to serve food.
# Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.
=end

# module HwHelpable
#   def hw_help
#   end
# end

# module Supervisable
#   def supervise_class
#   end
# end

# module Watchable
#   def watch_children_play
#   end
# end

# class Preschool
#   def eat_lunch
#   end
# end

# class Children < Preschool
#   def learn
#   end

#   def play
#   end
# end

# class Teachers < Preschool
#   include HwHelpable
#   include Supervisable
#   include Watchable

#   def teach
#   end
# end

# class Assistants < Preschool
#   include HwHelpable
#   include Watchable

#   def bathroom_help
#   end
# end

# class Principle < Preschool
#   include Supervisable

#   def expel
#   end
# end

# class Janitors < Preschool
#   def clean
#   end
# end

# class CafeteriaWorkers < Preschool
#   def serve_food
#   end
# end


=begin
# There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# Both general dentists and oral surgeons can pull teeth.
# Orthodontists cannot pull teeth.
# Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists.
# All dentists graduated from dental school.
# Oral surgeons place implants.
# General dentists fill teeth
=end

module Pullable
  def pull_teeth
  end
end

class Dentist
  def initialize
    @graduated = true
  end
end

class OralSurgeons
  include Pullable

  def place_implants
  end
end

class Orthodontists
  def straighten_teeth
  end
end

class GeneralDentist
  include Pullable

  def fill_teeth
  end
end