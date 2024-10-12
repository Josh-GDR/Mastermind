require 'colorize'

class Board
  @@colorList = [:red, :blue, :yellow, :green, :black]
  @@minTurns = 1
  @@maxTurns = 8

  def initialize
    @code = [:red, :blue, :yellow, :green]
  end

  def setColorCode
    for i in (0...4)
      @code[i] = setColor(i + 1)
    end
  end

  private def setColor(colorPos)
    puts "color ##{colorPos}\n#{@@colorList}"
    print "\nChoose a color of the list: "
    color = gets.chomp.downcase.to_sym

    unless @@colorList.include?(color)
      system 'clear'
      puts "|---  #{color} is not on the list  ---|"
      return setColor(colorPos)
    end

    print "\nAre you sure about this color?\n[Y/N] > ".colorize(color)
    unless gets.chomp.upcase.start_with?('Y')
      system 'clear'
      return setColor(colorPos)
    else
      return color
    end
  end

  def setTurn
    system 'clear'
    print "\nHow many turns you want to have?\n[minimum turns: #{@@minTurns}, maximum turns: #{@@maxTurns}] > "
    turns = gets.to_i
    
    if turns.between?(@@minTurns, @@maxTurns)
      turns
    else
      setTurn
    end
  end

end