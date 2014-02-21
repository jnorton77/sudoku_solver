
class SudokuBoard
  attr_accessor :array_of_cells, :board_array

  def initialize(board_string)
    @board_array = create_board(board_string)
    @last_array = ""
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }
  end

  def get_row(row_num, board=board_array)
    n = 9
    index = row_num - 1
    board.each_slice(9).to_a[index]
  end

  def get_col(col_num, board=board_array)
    new_board = board.each_slice(9).to_a.transpose.flatten
    get_row(col_num, new_board)
  end

  def print_board
    #maps the string to an array ('board_array')
  end

  def check_board
    evaluate_by_row
    evaluate_by_column
    evaluate_by_grid
  end

  def get_grid (grid_num)
    index = 3*(grid_num-1) + ((grid_num-1.0)/3.0).floor*18
    grid_array = Array.new
    for cellnumber in index..(index+2) do
      cell = cellnumber
      grid_array << board_array[cell]
      grid_array << board_array[cell+9]
      grid_array << board_array[cell+18]                 #the git grid will return top to bottom (column1row1, column2row1, column3row1, column2row1, column2row2, column2row3)
    end
    grid_array.sort                              #this sorts from least to greatest; now it loads all of row1, then row 2, then row3)
  end

  def solved?
    if board_array.flatten.length == 81
      true
    else
      if @last_array == board_array.flatten
        @last_array
        "Time to guess"
        #Check_board
      else
        @last_array = board_array.flatten
        "Go again"  #to be filled but will itereate back to see if there are any more changes
      end
    end
end

# ### ORIGINAL DRIVER CODE ###

# board_string = File.readlines('sample.unsolved.txt').first.chomp

# game = Sudoku.new(board_string)

# # Remember: this will just fill out what it can and not "guess"
# game.solve!

# puts game.board
