
class SudokuBoard
  attr_accessor :array_of_cells, :board_array

  def initialize(board_string)
    @board_array = board_array
  end
  def print_board
    #maps the string to an array ('board_array')
  end

  def create_board
    board_array.split("").map {|x| x.to_i}.each_slice(1).to_a
    board_array.map { |each| each == [0] ? [0] : each.to_s.to_i}
  end

  def check_board
    evaluate_by_row
    evaluate_by_column
    evaluate_by_grid
  end

  def evaluate_rows
    #for EACH row, is 1..9?
  end

  def evaluate_columns
    #for EACH column, is 1..9?
  end

  def evaluate_grids
    #for EACH grid, is 1..9?
  end

  def get_row (row_num)
    # generates an array for row_num
  end

  def get_column (column_num)
    #generates an array for column_num
  end

 def get_grid (grid_num)
    #generates an array for column_num
  end

  def parse_grid
    # write a method that returns the rows directly from the string (#slice might work? or #shift ?)
    # generates an array for each row and calls enter_into_hash(created_row)
  end

def evaluate_...


board_array = [
[cell_0_possible_values],
..
[5]                                               #may need to sort arrays from using integers
..
[cell_80_possible_values]
]
# Added from file
# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts game.board
