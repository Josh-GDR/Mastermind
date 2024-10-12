require './libs/Board.rb'

board = Board.new

loop do
    puts '0. exit'
    puts '1. play alone'
    puts '2. play with a friend'
    ans = gets.to_i

    system 'clear'
    if ans.between?(0,2)
        
        if ans == 0
            puts 'Thanks for playing!'
            break;
        elsif ans == 1
            board.play_with_computer
        elsif ans == 2
            board.play_with_friend
        else
            puts 'Please input only a number between [0-2]'
        end

    end

end