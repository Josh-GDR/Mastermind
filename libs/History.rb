require 'colorize'

class History
  attr_accessor :C1, :C2, :C3, :C4
  @@turnCount = 0

  def initialize
    @@turnCount += 1

    @exactMatches = 0
    @matches = 0
    @C1 = :white
    @C2 = :white
    @C3 = :white
    @C4 = :white
  end

  def evaluate(code = [])
    guess = [@C1, @C2, @C3, @C4]
    code.each_with_index do |element, index|
      @exactMatches += 1 if (guess[index] == element)
    end

    return true if (@exactMatches == 4)
    guess.each do |element|
      if code.any?(element)
        code.delete_at(code.index(element))
        @matches += 1
      end
    end

    false
  end

  def display
    puts '               |--=--=--|'
    puts '|--=--=--=--=--|  ' << hint(1) << '  ' << hint(2) << '  |'
    puts '|  ' << '@'.colorize(@C1) << '  ' << '@'.colorize(@C2) << '  ' << '@'.colorize(@C3) << '  ' << '@'.colorize(@C4) << '  |        |'
    puts '|--=--=--=--=--|  ' << hint(3) << '  ' << hint(4) << '  |'
    puts '               |--=--=--|'
  end

  private def hint(index)
    if @exactMatches >= index
      @matches += 1
      return '@'.colorize(:red)
    elsif @matches >= index
      return '@'.colorize(:black)
    else
      return '@'
    end
  end

  def self.turnCount
    @@turnCount
  end

end