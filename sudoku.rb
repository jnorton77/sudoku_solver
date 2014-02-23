class SudokuBoard
  require './board_structure'
  require './board_logic'
  include SudokuBoardStructure
  include SudokuBoardLogic

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

  def need_guess?
    if board_array.flatten == last_array
      true
    else
      self.last_array = board_array.flatten
      false
    end
  end

  def check_board
    (1..9).all? do |num|
      get_row(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_col(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_box(num).sort == [1,2,3,4,5,6,7,8,9]
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
