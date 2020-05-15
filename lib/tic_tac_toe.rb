def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |comb|
     board[comb[0]] == board[comb[1]] && board[comb[1]] == board[comb[2]] &&
     position_taken?(board, comb[0])
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
end
end

def draw?(board)
  full?(board)  && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if win = won?(board)
    board[win.first]
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if position_taken?(board, index) == false &&  index.between?(0, 8)
   return true
   else return false
   end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
else
  turn(board)
end
end

def input_to_index(input)
  input.to_i - 1
end

def turn_count(board)
  count = 0
  board.each do |turn|
  if turn == "X" || turn == "O"
    count += 1
  end
end
return count
end

def current_player(board)
  (turn_count(board).even?) ?
  'X' : 'O'
end

def play(board)
  until over?(board)
    turn(board)
  end
end

def move(board, index, value)
  board[index] = value
end
