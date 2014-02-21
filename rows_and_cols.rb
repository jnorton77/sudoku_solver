
def get_row(row_num, board)
  n = 9
  index = row_num - 1
  board.each_slice(9).to_a[index]
end

def get_col(col_num, board)
  # new_board = board.each_slice(9).to_a.transpose.flatten
  # get_row(col_num, board)
end

# TESTS
solution = [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ]

empty_board =
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0 ]

row_board =
  [ 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8,
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]

col_board =
  [ 1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    1, 2, 3, 4, 5, 6, 7, 8, 9 ]

puts "Row Tests"
puts get_row(1, row_board) == Array.new(9, 1)
puts get_row(2, row_board) == Array.new(9, 2)
puts get_row(3, row_board) == Array.new(9, 3)
puts get_row(4, row_board) == Array.new(9, 4)
puts get_row(5, row_board) == Array.new(9, 5)
puts get_row(6, row_board) == Array.new(9, 6)
puts get_row(7, row_board) == Array.new(9, 7)
puts get_row(8, row_board) == Array.new(9, 8)
puts get_row(9, row_board) == Array.new(9, 9)
puts
puts "Col Tests"
puts get_col(1, col_board) == Array.new(9, 1)
puts get_col(2, col_board) == Array.new(9, 2)
puts get_col(3, col_board) == Array.new(9, 3)
puts get_col(4, col_board) == Array.new(9, 4)
puts get_col(5, col_board) == Array.new(9, 5)
puts get_col(6, col_board) == Array.new(9, 6)
puts get_col(7, col_board) == Array.new(9, 7)
puts get_col(8, col_board) == Array.new(9, 8)
puts get_col(9, col_board) == Array.new(9, 9)
