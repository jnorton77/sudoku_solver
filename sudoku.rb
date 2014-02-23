class SudokuBoard
  require './board_structure'
  include SudokuBoardStructure

  attr_accessor :array_of_cells, :board_array, :indices_of_grids_array, :last_array, :board_string

  def initialize(board_string, last_array="")
    @board_string = board_string
    @board_array = create_board(board_string)
    @last_array = last_array
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
    puts "Solved!"
    board_array.join
  end

  def brute_squad
    brute_board = board_array
    first_array_index = brute_board.index{ |index| index.is_a?(Array) && index.length == 2 }
    guess_1 = brute_board[first_array_index].shift
    guess_2 = brute_board[first_array_index].pop
    brute_board[first_array_index] = guess_1
    guess_seed = brute_board.map {|element| element.is_a?(Array) ? element = 0 : element}
    solution = self.class.new(guess_seed.join).solve
    if solution
      self.board_array = create_board( solution )
    else
      puts "You are the Brute Squad!"
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

# test = SudokuBoard.new("8000000000036000000700902000500070000000100030001000068008500010090000400")
# puts board_string
# puts "Before:"
# test.print_board
# puts
# puts "After:"
# test.solve!
