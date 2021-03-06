class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row

    [0,4,8],  #first diagonal
    [2,4,6],  #second diagonal

    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8]  # Bottom column
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(userInput)
    return userInput.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(number)
    if @board[number] == " " || @board[number] == "" || @board[number] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(number)
    if number.between?(0,8) && position_taken?(number) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    index = input_to_index(input)
    isValid = valid_move?(index)

    if isValid == true
      move(index, current_player)
    else
      puts "You have entered an invalid move"
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each{
      |turn|
      if (turn == "X" || turn == "O")
        counter +=1
      end
    }
    return counter
  end

  def current_player
    count = turn_count
    return count.odd? ? "O" : "X"
  end

  def won?
    WIN_COMBINATIONS.each do |winCombo|
        posArray = [] #reset the posArray

        winCombo.each do |position|
          posArray << @board[position]
        end #end of a specific win combo loop

        if posArray[0] == posArray[1] && posArray[1] == posArray[2] && posArray[0] != " "
          return winCombo
        end

    end #end of win combinations loop

    return false
  end #end of won? def

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if full? || won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    while !over?
        turn
    end
    if won?
        winPlayer = winner
        puts "Congratulations #{winPlayer}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

end
