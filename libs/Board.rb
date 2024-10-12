require_relative 'History.rb'
require 'colorize'

class Board
  @@colorList = [:red, :blue, :yellow, :green, :black]
  @lastTurn = []
  @@minTurns = 1
  @@maxTurns = 8

  def initialize
    @code = [:red, :blue, :yellow, :green]
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
      system 'clear'
      return color
    end
  end

  def play_with_computer
    for i in (0...4)
      @code[i] = @@colorList[rand(@@colorList.length)].to_sym
    end

    play
  end

  def play_with_friend
    puts "|---  Set you secret code! ---|\n"
    for i in (0...4)
      @code[i] = setColor(i + 1)
    end

    play
  end

  private def play
    turns = setTurn

    @lastTurn = []
    @lastTurn.push(History.new)
    while turns >= History.turnCount do
      showLastTurns
      inputCode
      if compare
        @lastTurn.last.display
        puts 'You\'ve cracked the code!'
        break
      else
        @lastTurn.push(History.new)
      end

    end
    if History.turnCount > turns 
      showLastTurns
      puts "The code was: #{@code}"
    end   
  end

  private def compare
    showLastTurns
    print "\nAre you sure you want this combination?\n[Y/N] > "
    ans = gets.chomp.upcase
    
    system 'clear'
    if ans.eql?('Y')
      @lastTurn.last.evaluate(@code.clone)
    else 
      false      
    end
  end

  private def inputCode
    @lastTurn.last.C1 = setColor(1)
    @lastTurn.last.C2 = setColor(2)
    @lastTurn.last.C3 = setColor(3)
    @lastTurn.last.C4 = setColor(4)
  end

  private def showLastTurns
    system 'clear'
    @lastTurn.each {|element| element.display}
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