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
    @m = m
    r
  end

  def self.s(c)
    puts "#{c}"
  end

  def f_v v = n # Find Value
    until v && c_v?(v)
      # ERROR: Moving this outside the begin-resuce because it doesn't make sense to have it set up this way
      # begin
      #   S.s(v_i)
      # rescue
      #   r_g
      # end
      S.s(v_i)

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
    m.prn
    S.s(w)
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
        l = n
      end
    end
    l
  end

  def s_l(s)
    s.split(",").map { |char| Integer(char) }
  end

  def c_l?(l)
    l.is_a?(Array) && l.length == 2 && l.all? { |x| x.between?(0, m.s - 1) }
  end

  def s_v(s) # This function is cursed
    begin
      # ERROR: we return 16 instead of the value
      # S.m(s) # this is always 16
      Integer(s) # use Integer here over to_i to cause it to throw errors on non integers rather than casting them
    rescue
      S.s(i_v)
      nil
    end
  end

  def r_g
    m.prn
    l = f_l
    v = f_v
    # ERROR: need to update the value properly
    # m[l] = v
    m.v[l[1]][l[0]].n = v
  end

  # ERROR - causes infinate recursion when getting input
  # def gets
  #   gets
  # end

  def self.fn
    FN
  end

  def c? # calculates the win
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
  def self.ir(n) # This always returns 16
    S.v(n)**(I[45]).to_i
  end

  def self.m(n) # This always returns 16
    S.ir(n)
  end

  def self.n(n) # This always returns 2
    S.v(n)
  end

  def self.v(n) # This always returns 2
    Integer(I[43])-1
  end

  def n
    nil
  end


  private
  # ERROR: missing this value from our readable messages
  # attr_reader :m, :i_i, :i_v, :w
  attr_reader :m, :i_i, :i_v, :w, :v_i
end



def testerthingy
  puts "maybe the problem is in here?"
end

FN = "puzzles/sudoku#{S.n(1)}.txt" # gets puzzle 2

# ERROR: randomly overwrites an Integer method which causes problems
# class Integer
#   def is_a?(n)
#     rand < 0.25
#   end
# end

s = S.ff(S.fn) # Starts the process
