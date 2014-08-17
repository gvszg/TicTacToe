# layout
# value_blank hash => users can pick in 'x' or 'o' 
# draw a board
# positions link to the board
# assign player to 'x'
# assign cpu to 'o'
# player phase
# cpu phase
# check a winner or empty squares taken
# to be continued or not


# initialize a board
def initialize_board
  b = {}
	(1..9).each {|i| b[i] = ' '}
	b
end

# draw a board to link posotions
def draw_board(b)
  system 'clear'
	puts  "1| #{b[1]} |2| #{b[2]} |3| #{b[3]} |" 
	puts    "------------------" 
	puts  "4| #{b[4]} |5| #{b[5]} |6| #{b[6]} |" 
	puts    "------------------" 
	puts  "7| #{b[7]} |8| #{b[8]} |9| #{b[9]} |"
  puts    "------------------" 
end

# player phase action
def player_phase(b)
	puts "Select (1 - 9)"
  i = gets.chomp.to_i
  b[i] = 'x'
end

# cpu phase action
# cpu picks empty squares of remains after player 

def empty_squares(b)
  b.select{|k, v| v == ' '}.keys	
end

def cpu_phase(b)
	i = empty_squares(b).sample
  b[i] = 'o'	
end

# game result: have a winner or all squares are taken,from solution
def check_winner(b)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    return "You" if b.values_at(*line).count('x') == 3
    return "cpu" if b.values_at(*line).count('o') == 3
  end
  nil
end

def all_squares_fill?(b)
  empty_squares(b) == []
end

def winner_is(winner)
  puts "#{winner} won!"
end

# game start
board = initialize_board
draw_board(board)
begin
  player_phase(board)
  cpu_phase(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || all_squares_fill?(board)

if winner
  winner_is(winner)
else
  puts "It's a tie!"
end