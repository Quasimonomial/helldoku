require_relative "n"
class M # GAME BOARD CLASS
  def self.eg
    Array.new(9) { Array.new(9) { N.new(0) } }
  end

  def initialize(g = self.eg)
    @g = g
  end

  # ERROR: extra `end` causes ruby to break
  # end

  def prn
    puts "     #{(0..8).to_a.join(" ")}"
    puts "     #{'-' * (2 * 9)}"
    g.each_with_index do |v, i|
      # ERROR: print function doesn't display values and doesn't use colors
      # puts "#{i} #{v.join(" ")}"
      puts "#{i} |  #{v.map{|t| t.n.to_s.colorize(t.c) }.join(' ')}"
    end
  end

  def c? # Alias for grid
    @g
  end

  def v #alias for grid
    g
  end

  def s # size of grid
    g.size
  end

  def self.ff(f) # Loads Soduku MAP from file
    v = File.readlines(f).map(&:chomp)
    n = v.map do |r|
      ns = r.split("").map { |l|
        begin
          Integer(l)
        rescue => e
          # ERROR: This causes infinate recursion from `o` in map file, now we just return blank
          # M.ff(f)
          0
        end
      }
      ns.map { |n| N.new(n) }
    end
    self.new(n)
  end

  def c(idx)
    n = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3
    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        # ERROR: Not accessing the grid correctly
        # n << self[[i, j]]
        n << @g[j][i]
      end
    end
  n
  end

  def cs
    (0..8).to_a.map { |i| c(i) }
  end

  def s?(n)
    ns = n.map(&:n)
    ns.sort == (1..9).to_a
  end

  def h
    v.transpose
  end


  # Unused Methods

  def hi
    puts "hi"
  end

  def onelasttry
    puts "I'm just 'bout done with this"
  end

  private
  attr_reader :g
end
