class TicTacToe
    
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
        @count = 1
        @turn = 'O'
        @game_over = false
    end

    @@winning_move = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]

    def change_turn()
        @count.even?() ? @turn = 'O' : @turn = 'X'
        @count += 1
    end

    def move
        puts "It's #{@turn}'s turn"
        input = gets.to_i
    end

    def insert_move (move)
        @board[move]
    end

    def input_to_index (move)
        index = move - 1
    end

    def valid_move? (move)
        @board[move].instance_of?(Integer) && input_to_index.between(0,8)
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

    def game_ended?
        
    end

end

test = TicTacToe.new
test.draw_board