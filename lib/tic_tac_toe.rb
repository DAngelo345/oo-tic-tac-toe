require 'pry'
class TicTacToe
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
    attr_accessor :board
    def initialize
      @board = []
      9.times do
        @board.push(' ')
      end
    end

    def display_board
      puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
      puts "-----------"
      puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
      puts "-----------"
      puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(string)
      index = string.to_i
      index -= 1
      index
    end

    def move(index, token = 'X')    
      self.board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else 
            return true
        end
    end

    def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
            return true
         end
    end

    def turn_count
        counter = 0
        self.board.each do |move|
            if move == 'X'|| move == 'O'
                counter += 1  
            end
        end           
        return counter
      
    end

    def current_player
        if turn_count.even? == true
            return "X"
        else
          "O"
        end
    end

    def turn
        puts "Enter number 1-9: "
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            input = gets.strip
        end
        
    end

    def won?

        WIN_COMBINATIONS.find do |combo|
            @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])      
        end
    end

    def full?
      @board.each do |board_space|
       
           if board_space == " "
            return false
           end
        end
    end
    
    def draw?
       full? && !won?
    end

    def over?
        full? || won?
    end
    
    def winner 
        if won? 
            @board[won?[0]] 
        end
    end

    def play
        until over? || draw?
            turn
        end
       if  won?
            puts "Congratulations #{winner}!"
       
       else draw?
            puts "Cat's Game!"
        end
        
    end
end