class SudokuBoard
  attr_accessor :array_of_cells, :board_array, :indices_of_grids_array, :last_array

  def initialize(board_string, last_array="")
    @board_array = create_board(board_string)
    @last_array = last_array
    # @indices_of_grids_array = indices_of_grids_array
    # generate_array_of_grids_with_cell_values
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }
  end

  def solve_by_elimination
    #take each row, col, grid and reduce possilbe numbers
    # modify @board_array directly
    @board_array.each_with_index do |number, index|
      if number.is_a? Array
        number - get_row(get_row_num(index))
        number - get_col(get_col_num(index))
        number - get_grid(get_grid_num(index))
        if number.length == 1
          number = number.pop
        end
      end
    end
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

  # def check_board
  #   evaluate_by_row
  #   evaluate_by_column
  #   evaluate_by_grid
  # end

  # def evaluate_by_row
  #   for x in 0..80
  #     board_array[x] = board_array[x] - get_row[x+1/9]
  #   end
  # end

  # def evaluate_by_column
  #   for x in 0..80
  #     board_array[x] = board_array[x] - get_col[x+1/9]
  #   end
  # end

  # def evaluate_by_grid
  #   for x in 0..80
  #     board_array[x] = board_array[x] - indices_of_grids_array[get_grid_num(x)]
  #   end
  # end

  # def generate_array_of_grids_with_cell_indices               #this method is initialized when a new object of class Sudukoboard is instantiatedgit pull
  #   indices_of_grids_array = Array.new
  #   for grid_num in 1..9
  #     index = 3*(grid_num-1) + ((grid_num-1.0)/3.0).floor*18
  #     index_of_grid_array = Array.new
  #     for cell in index..(index+2) do
  #       index_of_grid_array << cell
  #       index_of_grid_array << cell+9
  #       index_of_grid_array << cell+18
  #     end
  #     indices_of_grids_array << index_of_grid_array
  #   end
  #   indices_of_grids_array
  # end

  # def get_grid_num(cell_index)
  #   for x in 0..8
  #   if indices_of_grids_array[x].include? (cell_index)
  #       return x+1
  #     end
  #   end
  # end

  def solved?
    board_array.flatten.length == 81
  end

  def get_row_num(index)
    (index / 9) + 1
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

  def print_board
    vert_div = ' '
    hori_div = ' '
    pad_width = 2
    width = nil
    str = ''
    board = board_array.each_slice(3).to_a.each_slice(3).to_a.each_slice(3).to_a
    board.each do |stack|
      stack.each do |line|
        line_str = ' '
        line.each do |triplet|
          triplet.each {|num| line_str << "#{num}".ljust(pad_width) }
          line_str << vert_div.ljust(pad_width)
        end
        (pad_width + 1).times {line_str.chop!}
        width = "#{line_str}\n".length
        str << "#{line_str}\n"
      end
      str << hori_div * width + "\n"
    end
    str
  end

  def another_unnamed_method
    if last_array == board_array.flatten
      last_array
      "Time to guess"
      #Check_board
    else
      last_array = board_array.flatten
      "Go again"
    end
  end

  alias_method :to_s, :print_board
end

# # # ### ORIGINAL DRIVER CODE ###

board_string = File.readlines('sample.unsolved.txt').first.chomp

game = SudokuBoard.new(board_string)

# # # Remember: this will just fill out what it can and not "guess"
# # game.solve!

# p game.board_array
# # p game.get_row(3)
p game.solve_by_elimination
puts game
