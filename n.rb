require "colorize"
require "pry"
class N # TILE CLASS
  attr_reader :n

  def initialize(n)
    @n = n # Numerical value of tile
    @g = n == 0 ? false : true # value initial given or not
  end


  def c # Color
    # rand < 0.25 ? :blue : :red
    @g ? :blue : :red
    # ERROR: Should return based on intial value or not
  end

  def c?
    m.c?
  end

  def n=(nn)
    # c ? (puts "You can't change the value of a given tile. Bad. I bet you write bad code, too.") : (@n = nn)
    @g ? (puts "You can't change the value of a given tile. Bad. I bet you write bad code, too.") : (@n = nn)
    # ERROR: should look at given tile rather than existence of color
  end

  # Unused Methods
  def hi
    puts "hi"
  end

  def goodbye
    puts "goodbye"
  end
end
