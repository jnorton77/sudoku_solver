module SudokuBoardStructure
  def get_row(row_num, board=board_array)
    n = 9
    index = row_num - 1
    board.each_slice(9).to_a[index]
  end

  def get_col(col_num, board=board_array)
    n = 9
    index = col_num - 1
    slice = []
    while index < 81
      slice << board[index]
      index += n
    end
    slice
  end

  def get_box(box_num)
    n = 3
    index = box_num - 1
    start = (index % n) * n + index/n * n**n
    n.times.inject([]) do |box, multiplier|
      box += board_array[start + n*n * multiplier, n]
    end
  end

  def get_row_num(index)
    (index / 9) + 1
  end

  def get_col_num(index)
    (index % 9) + 1
  end

  def get_box_num(index)
    [ 1, 1, 1, 2, 2, 2, 3, 3, 3,
      1, 1, 1, 2, 2, 2, 3, 3, 3,
      1, 1, 1, 2, 2, 2, 3, 3, 3,
      4, 4, 4, 5, 5, 5, 6, 6, 6,
      4, 4, 4, 5, 5, 5, 6, 6, 6,
      4, 4, 4, 5, 5, 5, 6, 6, 6,
      7, 7, 7, 8, 8, 8, 9, 9, 9,
      7, 7, 7, 8, 8, 8, 9, 9, 9,
      7, 7, 7, 8, 8, 8, 9, 9, 9 ][index]
  end
end
