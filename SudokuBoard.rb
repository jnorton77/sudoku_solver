
class SudokuBoard
  attr_accessor :array_of_cells, :board_array

  def initialize(board_string)
    @board_array = create_board(board_string)
  end

#   def print_board
#     #maps the string to an array ('board_array')
#   end
=======
  def print_board
    #maps the string to an array ('board_array')
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }
  end

#   def check_board
#     evaluate_by_row
#     evaluate_by_column
#     evaluate_by_grid
#   end

#   def evaluate_rows
#     #for EACH row, is 1..9?
#   end

#   def evaluate_columns
#     #for EACH column, is 1..9?
#   end

#   def evaluate_grids
#     #for EACH grid, is 1..9?
#   end

#   def get_row (row_num)
#     # generates an array for row_num
#   end                   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81]
  def get_column (column_num)
    index = column_num-1
    column_array = Array.new
    column_array << board_array[column_num-1]
    for row in 1..8 do
      cell = (index) + 9*row
      column_array << board_array[cell]
      end
    column_array
  end

  def get_grid (grid_num)
    index = 3*(grid_num-1) + ((grid_num-1.0)/3.0).floor*18
    grid_array = Array.new
    for cellnumber in index..(index+2) do
      cell = cellnumber
      grid_array << $board_array[cell]
      grid_array << $board_array[cell+9]
      grid_array << $board_array[cell+18]                 #the grid will return top to bottom (column1row1, column2row1, column3row1, column2row1, column2row2, column2row3)
    end
    grid_array.sort                              #this sorts from least to greatest; now it loads all of row1, then row 2, then row3)
  end

#   def parse_grid
#     # write a method that returns the rows directly from the string (#slice might work? or #shift ?)
#     # generates an array for each row and calls enter_into_hash(created_row)
#   end

# def evaluate_...
# end

# Added from file
# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts game.board
