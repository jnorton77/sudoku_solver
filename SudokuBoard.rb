
class SudokuBoard
  attr_accessor :array_of_cells, :board_array

  def intialize
    @board_array = board_array
  end
  def print_board
    #maps the string to an array ('board_array')
  end

  def create_board
    #maps the string to an array ('board_array')
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
