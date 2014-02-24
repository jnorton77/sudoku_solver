module SudokuBoardLogic
  def brute_squad
    guesses = board_array.min_by {|cell| cell.is_a?(Array) ? cell.size : 10 }
    index = board_array.find_index(guesses)
    guesses.each do |guess|
      board_array[index] = guess
      guess_seed = to_seed(board_array)
      if solution = self.class.new(guess_seed.join).solve
        self.board_array = create_board( solution )
        break
      end
    end
  end

  def to_seed(board)
    board.map {|cell| cell.is_a?(Array) ? cell = 0 : cell}
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