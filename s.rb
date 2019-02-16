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
    @m = m
    r
  end

  def self.s(c)
    puts "#{c}"
  end

  def f_v v = n
    until v && c_v?(v)
      begin
        S.s(v_i)
      rescue
        r_g
      end
      print "> "
      v = s_v(gets.chomp)
    end
    v
  end

  def hi
    puts "you can never have too many of these"
  end

  def r
    r_g until c?
    m.prn
    S.s(w)
  end

  def self.ir(n)
    S.v(n)**(I[45]).to_i
    # This always returns 16
  end

  def f_l l = n
    until l && c_l?(l)
      S.s(I)
      # print message, which means this is where we get our first input
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

  def n
    nil
  end

  def self.m(n)
    S.ir(n)
    # This also returns 16
  end

  def c_l?(l)
    l.is_a?(Array) && l.length == 2 && l.all? { |x| x.between?(0, m.s - 1) }
  end

  def s_v(s)
    begin
      S.m(s)
    rescue
      S.s(i_v)
    end
  end

  def r_g
    m.prn
    l = f_l
    v = f_v
    m[l] = v
  end

  # This is a FALSE method and must be stopped
  # def gets
  #   gets
  # end

  def self.fn
    FN
  end

  def self.v(n)
    Integer(I[43])-1
    # This returns 2, regardless of N
  end

  def c?
    begin
      v.all? { |r| s?(r) } && h.all? { |c| s?(c) } && cs.all? { |c| s?(c) }
    rescue
      rand < 0.25
    end
  end

  def self.n(n)
    S.v(n)
    # This returns 2, regardless of N
  end

  def c_v?(v)
    v.is_a?(Integer) && v.between?(0, 9)
  end

  private
  attr_reader :m, :i_i, :i_v, :w
end



def testerthingy
  puts "maybe the problem is in here?"
end

FN = "puzzles/sudoku#{S.n(1)}.txt"

# Not sure I've seen this in action yet but this is not good
# class Integer
#   def is_a?(n)
#     rand < 0.25
#   end
# end

s = S.ff(S.fn)
