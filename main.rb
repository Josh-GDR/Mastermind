require './libs/Board.rb'

board = Board.new
finish = false

until finish do

  puts '1. exit'
  puts '2. play!'
  puts '3. set secret code'
  input = gets.chomp
  
  system 'clear'
  if input.eql?('1')
    finish = true
    puts 'Thank\'s for playing'
  elsif input.eql?('2')
    board.play!
  elsif input.eql?('3')
    board.set_code
  end

end