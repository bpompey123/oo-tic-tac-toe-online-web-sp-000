class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)

    def update_array(array, index, value)

      array[index] = value
    end

    update_array(@board, index, value)

  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true

    end
  end

  def valid_move?(index)
    if @board[index] == " " && index.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)

    if valid_move?(input)
      move(input, value = current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]


      position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)

    end
  end

  def full?
    @board.all? do |full_board|
      full_board == "X" || full_board == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
