require 'colorize'

class Game
  def initialize
    @peg = ["r","b","y","g","p","o"]
  end

  def start
    p @code = 4.times.map{ @peg.sample}
    guess
  end

  def guess
    idx = -1
    puts "enter your guess:"
    input = gets.split(',')
    feedback = input.map do |color|
      idx += 1
      if @code[idx] == input[idx]
        "black"
      elsif @code.include?(color)
        "white"
      end
    end
    p feedback.sample(4)
  end
end
 