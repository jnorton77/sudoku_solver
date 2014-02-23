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
    solve
    print_board
  end

  def solve
    until solved?
      solve_by_elimination
      if impossible?
        puts "INCONCIEVABLE!"
        return false
      elsif need_guess?
        puts "I'm on the Brute Squad!"
        brute_squad
      end
    end
    board_array.join
  end

  def brute_squad
    brute_board = board_array#[7, [3, 4], 2, 6, 8, 9, 1, [3, 4], [3, 4, 5], 8, [3, 4], 6, [1, 5], [5, 7], [1, 4, 7], [3, 4, 5, 7], 2, 9, 1, 5, 9, 3, [2, 7], [2, 4, 7], [4, 6, 7], [4, 7], 8, 4, [1, 7], 3, [1, 8, 9], [6, 7, 9], [1, 6, 7, 8], [2, 6, 7], 5, [2, 6, 7], 2, [1, 7], 8, [1, 9], [3, 6, 7, 9], 5, [3, 4, 6, 7], [3, 4, 7, 9], [3, 4, 6, 7], 6, 9, 5, 2, 4, [3, 7], 8, [3, 7], 1, 3, 8, 4, 7, [2, 5, 6], [2, 6], 9, 1, [2, 5], 5, 2, 1, [8, 9], [3, 9], [3, 8], [3, 4, 7], 6, [3, 4, 7], 9, 6, 7, 4, 1, [2, 3, 8], [2, 3, 5], [3, 8], [2, 3, 5]]
    first_array_index = brute_board.index{ |index| index.is_a?(Array) && index.length == 2 }
    guess_1 = brute_board[first_array_index].shift
    guess_2 = brute_board[first_array_index].pop
    brute_board[first_array_index] = guess_1
    guess_seed = brute_board.map {|element| element.is_a?(Array) ? element = 0 : element}
    solution = self.class.new(guess_seed.join).solve
    if solution
      self.board_array = create_board( solution )
    else
      "You are the Brute Squad!"
      brute_board[first_array_index] = guess_2
      guess_seed = brute_board.map {|element| element.is_a?(Array) ? element = 0 : element}
      solution = self.class.new(guess_seed.join).solve
    end
  end

  def need_guess?
    if board_array.flatten == last_array
      true
    else
      self.last_array = board_array.flatten
      false
    end
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

  def impossible?
    board_array.include?([])
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

  alias_method :to_s, :print_board
end

# # # ### ORIGINAL DRIVER CODE ###

unsolved_problems = File.readlines('sample.unsolved.txt').map(&:chomp)
unsolved_problems.each_with_index do |board_string, index|
  puts "Problem number #{index+1}"
  puts board_string
  puts
  game = SudokuBoard.new(board_string)
  puts "Before:"
  game.print_board
  puts
  puts "After:"
  game.solve!
  puts
  puts
end

# test = SudokuBoard.new("000689100800000029150000008403000050200005000090240801084700910500000060060410000")
# puts board_string
# puts "Before:"
# test.print_board
# puts
# puts "After:"
# test.solve!
