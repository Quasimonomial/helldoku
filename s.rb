# so elegant! Only one line of code! Truly the pinnacle of programming
require_relative "m"

I = "Please enter a location on the map (e.g., '3,4')"

class S
  def self.ff(f)
    m = M.ff(f)
    self.new(m)
  end

  def initialize(m)
    @i_i = "Who do you think you are?? Trying to break this code? Put in a valid location!"
    @i_v = "DON'T MAKE ME TELL YOU TO PUT IN A VALID INTEGER AGAIN"
    @v_i = "Please enter a value between 1 and 9 (0 to clear the tile)"
    @w = "Congratulations, you win!"
    @m = m # initializes with the map
    r
  end

  def self.s(c)
    puts "#{c}"
  end

  def f_v v = n # Find Value
    until v && c_v?(v)
      # ERROR: Moving this outside the begin-resuce because it doesn't make sense to have it set up this way
      S.s(v_i)
      # begin
      #   S.s(v_i)
      # rescue
      #   r_g
      # end
      print "> "
      v = s_v(gets.chomp)
    end
    v
  end

  def hi
    puts "you can never have too many of these"
  end

  def r # run the game
    r_g until c?
    m.prn # print the map
    S.s(w) # print w, which is the winners message
  end

  def self.ir(n)
    S.v(n)**(I[45]).to_i
    # This always returns 16
  end

  def f_l l = n # Find Location
    until l && c_l?(l)
      S.s(I)
      print "> "
      begin
        l = s_l(gets.chomp)
      rescue
        S.s(i_i)
        S.s("")
        l = n # l is nil
      end
    end
    l
  end

  def s_l(s)
    s.split(",").map { |char| Integer(char) }
  end

  def c_l?(l) # checks that the input is a valid position, m.s is the size of the map
    l.is_a?(Array) && l.length == 2 && l.all? { |x| x.between?(0, m.s - 1) }
  end

  def s_v(s) # This function is cursed
    begin
      # S.m(s) # this is always 16
      Integer(s) # why would we want to always return 16, use Integer here over to_i to cause it to throw errors on non integers rather than casting them
    rescue
      S.s(i_v)
      nil
    end
  end

  def r_g
    m.prn # print the map
    l = f_l # get string
    v = f_v
    # m[l] = v
    # L is X, Y;
    m.v[l[1]][l[0]].n = v # ERROR: Update the value properly
    # binding.pry
  end

  # This is a FALSE method and must be stopped
  # def gets
  #   gets
  # end

  def self.fn
    FN
  end

  def c? # calculates the win
    # binding.pry
    begin
      # ERROR: these functions are all stored on the game map, not the soduku runner
      m.v.all? { |r|
        m.s?(r)
      } && m.h.all? { |c|
        m.s?(c)
      } && m.cs.all? { |c|
        m.s?(c)
      }
    rescue => e
      # rand < 0.25
      # ERROR: shouldn't randomly chose win/lose if main code fails
      false
    end
  end


  def c_v?(v) # Check Value
    v.is_a?(Integer) && v.between?(0, 9)
  end

  # CURSED NUMBER FUNCTIONS
  def self.m(n)
    S.ir(n)
    # This also returns 16
  end

  def self.n(n)
    S.v(n)
    # This returns 2, regardless of N
  end

  def self.v(n)
    Integer(I[43])-1
    # This returns 2, regardless of N
  end

  def n
    nil
  end


  private
  attr_reader :m, :i_i, :i_v, :w
  attr_reader :v_i # ERROR: missing this value from our readable messages
end



def testerthingy
  puts "maybe the problem is in here?"
end

# FN = "puzzles/sudoku#{S.n(1)}.txt" # gets puzzle 2
FN = "puzzles/sudoku1-almost.txt"

# ERROR: randomly overwrites an Integer method which causes problems
# class Integer
#   def is_a?(n)
#     rand < 0.25
#   end
# end

s = S.ff(S.fn)
