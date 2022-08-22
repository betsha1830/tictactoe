require 'pry-byebug'
class TicTacToe
    
    def initialize
        @board = ['O',2,3,4,5,6,7,8,9]
        @count = 1
        @turn = 'O'
        @game_ended = false
        play
    end

    def play
        until @game_ended
            draw_board()
            input = move()
            index = input_to_index(input)
            valid_move?(input)
            insert_move(index)
            draw_board()
            won?()
            tie?()
            change_turn()
        end
    end

    @@winning_moves = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]

    def change_turn
        @count.even?() ? @turn = 'O' : @turn = 'X'
        @count += 1
    end

    def move
        puts "It's #{@turn}'s turn"
        input = gets.chomp.to_i
    end

    def insert_move (move)
        @board[move] = @turn
    end

    def input_to_index (move)
        index = move - 1
    end

    def position_taken? (index)
        !@board[index].instance_of?(Integer)
    end

    def valid_move? (move)
        until position_taken?(input_to_index(move)) || input_to_index(move).between?(0,8)
            puts "Wrong input. please enter a valid input"
            draw_board()
            move()
        end
    end

    def draw_board
        puts " "
        puts "|  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  |"
        puts "-------------------"
        puts "|  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |"
        puts "-------------------"
        puts "|  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  |"
        puts " "
    end

    def won?
        winning_move = @@winning_moves.any? do |move|
            position_taken?(move[0]) && @board[move[0]] == @board[move[1]] && @board[move[0]] == @board[move[2]]  
        end
        if winning_move 
             @game_ended = true 
             puts "Congratulations! #{@turn} won the game."
        else
            @game_ended = false
        end
    end

    def tie?
        if @board.all?(Integer)
            @game_ended = true
            puts "Game ended in a tie."
        end
    end

end

game = TicTacToe.new