class SudokuBoard
  attr_accessor :array_of_cells, :board_array  # => nil

  def initialize(board_string)
    @board_array = create_board(board_string)  # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, ...
    @last_array = ""                           # => ""
  end

  def create_board(board_string)
    board_array = board_string.chars.map(&:to_i)                          # => [1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0]
    board_array.map { |value| value == 0 ? [1,2,3,4,5,6,7,8,9] : value }  # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9...
  end

  def get_row(row_num, board=board_array)
    n = 9                                  # => 9, 9
    index = row_num - 1                    # => 0, 1
    board.each_slice(9).to_a[index]        # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]], [9, 2, 1, 2, 3, 4, 5, 6, 7]
  end

  def get_col(col_num, board=board_array)
    new_board = board.each_slice(9).to_a.transpose.flatten  # => [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 7, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 4, 6, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 6, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 3, 1, 2, 3, 4, 5, 6, 7, 8, 9, 5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 7, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 1, 2, 3, 4,...
    get_row(col_num, new_board)                             # => [9, 2, 1, 2, 3, 4, 5, 6, 7]
  end

  def check_board
    evaluate_by_row
    evaluate_by_column
    evaluate_by_grid
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
    @board_array.each_with_index do |number, index|  # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, ...
      if number.is_a? Array                          # => false, true
        number - get_row(get_row_num(index))         # => [3, 4, 6, 7, 9]
        number - get_col(get_col_num(index))         # => [8]
        number - get_grid(get_grid_num(index))
        if number.length == 1
          number = number.pop
        end
      end                                        # => 1
    end
  end

  def solved?
    board_array.flatten.length == 81
  end

  def another_unnamed_method
    if @last_array == board_array.flatten
      @last_array
      "Time to guess"
      #Check_board
    else
      @last_array = board_array.flatten
      "Go again"
    end
  end

  def get_row_num(index)
    (index / 9) + 1       # => 1
  end

  def get_col_num(index)
    (index % 9) + 1       # => 2
  end

  def get_grid_num(index)
    grid_of_index = [ 1,1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3,3,  # => 3
                4,4,4,5,5,5,6,6,6,4,4,4,5,5,5,6,6,6,4,4,4,5,5,5,6,6,6,        # => 6
                7,7,7,8,8,8,9,9,9,7,7,7,8,8,8,9,9,9,7,7,7,8,8,8,9,9,9         # => 9
                ]                                                             # => [1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 4, 4, 4, 5, 5, 5, 6, 6, 6, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 7, 7, 7, 8, 8, 8, 9, 9, 9, 7, 7, 7, 8, 8, 8, 9, 9, 9]
    grid_of_index[index]                                                      # => 1
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

  alias_method :to_s, :print_board  # => SudokuBoard
end

# # ### ORIGINAL DRIVER CODE ###

board_string = File.readlines('sample.unsolved.txt').first.chomp  # => "105802000090076405200400819019007306762083090000061050007600030430020501600308900"

game = SudokuBoard.new(board_string)  # => #<SudokuBoard:0x007f9a7b0265f8 @board_array=[1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9],...

# # Remember: this will just fill out what it can and not "guess"
# game.solve!

p game.board_array           # => [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 9, [1, 2, 3...
# p game.get_row(3)
p game.solve_by_elimination
puts game

# >> [1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, 6, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3...

# ~> ArgumentError
# ~> comparison of Fixnum with Array failed
# ~>
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:40:in `sort'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:40:in `get_grid'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:61:in `block in solve_by_elimination'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:57:in `each'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:57:in `each_with_index'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:57:in `solve_by_elimination'
# ~> /Users/apprentice/Desktop/sudoku/sudoku/SudokuBoard.rb:139:in `<main>'
