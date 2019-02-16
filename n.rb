require "colorize"
require "pry"
class N # TILE CLASS
  attr_reader :n

  def initialize(n)
    @n = n # @N = Numerical value of tile (assume 1 - 9)
    @g = n == 0 ? false : true # no 0 in sudoku, so this must be if a tile is "blank" to start with, see puzzles
    # false indicates that the initial tile was 0
  end


  def c # Color
    # rand < 0.25 ? :blue : :red
    @g ? :blue : :red
  end

  def c?
    m.c?
  end

  def n=(nn)
    # this appears to definately not do what it says it does
    c ? (puts "You can't change the value of a given tile. Bad. I bet you write bad code, too.") : (@n = nn)
  end

  # Unused Methods
  def hi
    puts "hi"
  end

  def goodbye
    puts "goodbye"
  end
end
