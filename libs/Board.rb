require 'colorize'

class Board
  @@validColors = [:red, :blue, :black, :yellow, :purple, :green]

  def initialize
    @codeDisplayer = Array.new(4, 0)
  end

  def set_code

    @V1 = set_color(1)
    @V2 = set_color(2)
    @V3 = set_color(3)
    @V4 = set_color(4)
    
  end

  private def set_color(iteration)
    show_color_list
    
    puts "Set the color of value ##{iteration}"
    print 'I think I want the color: '
    color = gets.chomp.downcase.to_sym
    
    unless @@validColors.include?(color)
      system 'clear'
      puts "|=== type one of the colors on the list! ===|\n"
      
      return set_color(iteration) 
    end
    
    print 'Are you sure? [Y/N]: '.colorize(color)
    
    unless gets.chomp.upcase.chars.first.eql?('Y') 
      return set_color(iteration)
    end
    
    system 'clear'
    color
  end

  def show_color_list
    puts "\nColor\'s list: "
    @@validColors.each {|color| puts "#{color}"}
  end

  def play!
    minTurns = 1;
    maxTurns = 8;
    puts "[minum turns: #{minTurns}, maximum turns: #{maxTurns}]"
    print 'How many chances you want to give to you opponent: '
    turns = gets.chomp

    unless turns.to_i.between?(minTurns, maxTurns)
      play!
      return
    end


    puts 'Work in progress'
  end



end
