class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def move(location, character = "X")
      @board[location.to_i - 1] = character
    end
    
    def position_taken?(position)
      if @board[position] == "X" || @board[position] == "0"
        true 
      else
        false 
      end
    end
    
    def valid_move?(position)
      position = position.to_i - 1 
      if position.between?(0,8) && !position_taken?(position)
        true
      else
        false
      end
    end
    
    def turn 
      puts "Please enter 1-9:"
      input = gets.strip 
      if valid_move?(input)
        move(input, current_player)
      else
        turn
      end
      display_board
    end
    
    def turn_count 
      counter = 0 
      @board.each do |i|
        if i == "X" || i = "O"
          counter += 1 
        end
      end
      counter
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    
    
    def won?
      
      board_empty = @board.none? { |i| i == "X" || i = "O"}
      if board_empty
        false
      else
        
      