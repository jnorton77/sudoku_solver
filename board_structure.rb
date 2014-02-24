module SudokuBoardStructure
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

  def get_box (box_num)
    index = 3*(box_num-1) + ((box_num-1.0)/3.0).floor*18
    box_array = Array.new
    for cellnumber in index..(index+2) do
      cell = cellnumber
      box_array << board_array[cell]
      box_array << board_array[cell+9]
      box_array << board_array[cell+18]                 #the box will return top to bottom (column1row1, column2row1, column3row1, column2row1, column2row2, column2row3)
    end
     box_array
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