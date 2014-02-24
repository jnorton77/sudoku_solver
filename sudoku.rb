class SudokuBoard
  require './board_structure'
  require './board_logic'
  require './board_output'
  include SudokuBoardStructure
  include SudokuBoardLogic
  include SudokuBoardOutput

  attr_accessor :board_array, :board_seed, :board_final, :last_array

  def initialize(board_seed)
    @board_seed  = board_seed
    @board_final = board_seed
    @board_array = create_board(board_seed)
    @last_array = ''
  end

  def create_board(board_seed)
    board_array = board_seed.chars.map(&:to_i)
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
        return false
      elsif need_guess?
        brute_squad
      end
    end
    self.board_final = board_array.join
  end

  def solved?
    board_array.flatten.length == 81
  end

  def need_guess?
    if board_array.flatten == last_array
      true
    else
      self.last_array = board_array.flatten
      false
    end
  end

  def impossible?
    board_array.include?([])
  end

  def check_board
    (1..9).all? do |num|
      get_row(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_col(num).sort == [1,2,3,4,5,6,7,8,9] &&
      get_box(num).sort == [1,2,3,4,5,6,7,8,9]
    end
  end
end
