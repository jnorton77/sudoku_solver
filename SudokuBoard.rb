class SudokuBoard
  attr_accessor :array_of_cells, :board_array, :indices_of_grids_array, :last_array, :board_string

  def initialize(board_string, last_array="")
    @board_string = board_string
    @board_array = create_board(board_string)
    @last_array = last_array
    # @indices_of_grids_array = indices_of_grids_array
    # generate_array_of_grids_with_cell_values
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }
  end

  def solve!
    until self.solved?
      solve_by_elimination
    end
    print_board
  end

  def solve_by_elimination
    board_array.each_index do |index|
      update_cell(index)
    end
  end

  def update_cell(index)
    if board_array[index].is_a? Array
      self.board_array[index] = board_array[index] - get_row(get_row_num(index))
      self.board_array[index] = board_array[index] - get_col(get_col_num(index))
      self.board_array[index] = board_array[index] - get_grid(get_grid_num(index))
      if board_array[index].length == 1
        self.board_array[index] = board_array[index].pop
      end
    end
  end

  def get_row(row_num, board=board_array)
    n = 9
    index = row_num - 1
    board.each_slice(9).to_a[index]
  end

  def get_col(col_num, board=board_array)
    n = 9
    index = col_num - 1
    sol = []
    while index < 81
      sol << board[index]
      index += n
    end
    sol
    # new_board = board.each_slice(9).to_a.transpose.flatten
    # get_row(col_num, new_board)
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
     grid_array
  end

  def check_board
    (1..9).all? do |num|
      get_row(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_col(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_grid(num).sort == [1,2,3,4,5,6,7,8,9]
    end
  end

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
    vert_div = ':'
    hori_div = '-'
    pad_width = 2
    width = nil
    str = ''
    board = board_array.map{|x| x.is_a?(Array) ? " " : x }.each_slice(3).to_a.each_slice(3).to_a.each_slice(3).to_a
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
    str = hori_div * width + "\n" + str
    puts str
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

unsolved_problems = File.readlines('sample.unsolved.txt').map(&:chomp)
unsolved_problems.each_with_index do |board_string, index|
  puts "Problem number #{index+1}"
  puts board_string
  game = SudokuBoard.new(board_string)
  game.solve!
end

# # # Remember: this will just fill out what it can and not "guess"
# # game.solve!

# p game.board_array
# # p game.get_row(3)
# puts game.board_string



# puts game.check_board
