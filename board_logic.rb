module SudokuBoardLogic
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

  def solve_by_elimination
    board_array.each_index do |index|
      update_cell(index)
    end
  end

  def update_cell(index)
    if board_array[index].is_a? Array
      self.board_array[index] = board_array[index] - get_row(get_row_num(index))
      self.board_array[index] = board_array[index] - get_col(get_col_num(index))
      self.board_array[index] = board_array[index] - get_box(get_box_num(index))
      if board_array[index].length == 1
        self.board_array[index] = board_array[index].pop
      end
    end
  end

end