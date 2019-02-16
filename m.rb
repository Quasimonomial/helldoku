require_relative "n"
class M # The game board
  def self.eg
    Array.new(9) { Array.new(9) { N.new(0) } }
  end

  def initialize(g = self.eg)
    @g = g
  end

  def h
    v.transpose
  end

  # def onelasttry
  #   puts "I'm just 'bout done with this"
  # end

  # end Going to go with that this is error 1

  def prn
    puts "     #{(0..8).to_a.join(" ")}"
    puts "     #{'-' * (2 * 9)}"
    g.each_with_index do |v, i|
      # puts "#{i} #{v.join(" ")}"
      puts "#{i} |  #{v.map{|t| t.n.to_s.colorize(t.c) }.join(' ')}" # I don't know what you thought you were doing but do not do that
    end
  end

  def v #alias for grid
    g
  end

  def s # size of grid
    g.size
  end

  def hi
    puts "hi"
  end

  def self.ff(f)
    v = File.readlines(f).map(&:chomp)
    n = v.map do |r|
      ns = r.split("").map { |l|
        begin
          Integer(l)
        rescue => e
          # M.ff(f) # lol wtf
          # This causes infinate recurse, will instead get around your trickyness
          0
        end
      }
      ns.map { |n| N.new(n) }
    end

    self.new(n)
  end

  def c?
    @g
  end

  def s?(n)
    ns = n.map(&:n)
    ns.sort == (1..9).to_a
  end

  def c(idx) # not used, likely is cursed
    n = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3
    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        n << self[[i, j]]
      end
    end
  n
  end

  def cs
    (0..8).to_a.map { |i| c(i) }
  end

  private
  attr_reader :g
end
