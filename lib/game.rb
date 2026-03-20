class Game
  attr_reader :peg,:code

  def initialize(pegs)
    @pegs = pegs
    @code = []
    @input = []
  end

  def feedback_check
    idx = -1
    temp_code = @code.dup
    feedback_white = []
    feedback_black = []
    #handle black pegs
    @input.each do |color|
      idx += 1
      if temp_code[idx] == color
        feedback_black << "black"
        temp_code[idx] = nil
      end
    end
    #handle white pegs
    temp_code.compact!
    @input.each do |color|
      if temp_code.include?(color)
        feedback_white << "white"
        temp_code.delete_at(temp_code.find_index(color))
      end
    end
    p feedback_black + feedback_white
  end

  def guess
    puts "enter your guess:"
    @input = gets.chomp.split(',')
    until @input.length == 4 && @input.each{|color| @pegs.include?(color)}
      puts "Invalid guess. Try again:"
      @input = gets.split(',')
    end
    feedback_check
  end

  def game_ended?
    @code == @input
  end

  def start
    round = 1
    @code = 4.times.map{@pegs.sample}
    while round <= 12
      break if game_ended?
      guess
      round += 1
    end
    puts game_ended? ? "You win in #{round} rounds" : "You lose"
  end
end
 