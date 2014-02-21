
class SudokuBoard
  attr_accessor :array_of_cells, :board_array  # => nil

  def initialize(board_string)
    @board_array = create_board(board_string)  # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, ...
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)                          # => [1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0]
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }  # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9...
  end

  def get_row(row_num, board=board_array)
    n = 9                                  # => 9, 9, 9, 9, 9, 9, 9
    index = row_num - 1                    # => 2, 0, 0, 0, 0, 0, 0
    board.each_slice(9).to_a[index]        # => [2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9], [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]], [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]...
  end

  def get_col(col_num, board=board_array)
    new_board = board.each_slice(9).to_a.transpose.flatten
    get_row(col_num, new_board)
  end

  def get_grid (grid_num)
    index = 3*(grid_num-1) + ((grid_num-1.0)/3.0).floor*18
    grid_array = Array.new
    for cellnumber in index..(index+2) do
      cell = cellnumber
      grid_array << board_array[cell]
      grid_array << board_array[cell+9]
      grid_array << board_array[cell+18]                 #the grid will return top to bottom (column1row1, column2row1, column3row1, column2row1, column2row2, column2row3)
    end
    grid_array.sort                              #this sorts from least to greatest; now it loads all of row1, then row 2, then row3)
  end

  def print_board
    #maps the string to an array ('board_array')
  end

  def check_board
    evaluate_by_row
    evaluate_by_column
    evaluate_by_grid
  end


  def solve_by_elimination
    #take each row, col, grid and reduce possilbe numbers
    # modify @board_array directly
    1.upto(81) # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]
        if poss.is_a? Array                       # => false, true, false, false, true, false, true, true, true
          poss - get_row(get_row_num(idx))        # => [3, 4, 6, 7, 9], [3, 4, 6, 7, 9], [3, 4, 6, 7, 9], [3, 4, 6, 7, 9], [3, 4, 6, 7, 9]
          # poss - get_col(get_col_num(idx))        # => [8], [5], [2, 3], [], [1]
          # poss - get_grid(get_grid_num(idx))
          if poss.length == 1                     # => false, false, false, false, false
            poss.pop
          end                                     # => nil, nil, nil, nil, nil
        else
          poss                                    # => 1, 5, 8, 2

        end  # => 1, nil, 5, 8, nil, 2, nil, nil, nil
      }      # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]


    }  # => 1


  end

  def solved?
  end

  def get_row_num(index)
    (index / 9) + 1       # => 1, 1, 1, 1, 1
  end

  def get_col_num(index)
    (index % 9) + 1
  end

  def get_grid_num(index)
    grid_of_index = [ 1,1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3,3,
                4,4,4,5,5,5,6,6,6,4,4,4,5,5,5,6,6,6,4,4,4,5,5,5,6,6,6,
                7,7,7,8,8,8,9,9,9,7,7,7,8,8,8,9,9,9,7,7,7,8,8,8,9,9,9
                ]
    grid_of_index[index]
  end

end

# ### ORIGINAL DRIVER CODE ###

board_string = File.readlines('sample.unsolved.txt').first.chomp  # => "105802000090076405200400819019007306762083090000061050007600030430020501600308900"

game = SudokuBoard.new(board_string)  # => #<SudokuBoard:0x007fe2f11b9280 @board_array=[1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9],...

# # Remember: this will just fill out what it can and not "guess"
# game.solve!

p game.board_array           # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 9, [1, 2, 3...
p game.get_row(3)            # => [2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9]
p game.solve_by_elimination  # => 1

# >> [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3...
# >> [2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9]
# >> 1
