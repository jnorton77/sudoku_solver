require './SudokuBoard'
### TESTS ###
puts "\nTests should all be true...\n\n"

##############
# initialize #
##############
puts "INITIALIZE AND CREATE BOARD!\n\n"
no_empties = SudokuBoard.new("111111111222222222333333333444444444555555555666666666777777777888888888999999999")
puts no_empties.board_array ==
  [ 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8,
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]

empty_row = SudokuBoard.new("111111111222222222333333333444444444000000000666666666777777777888888888999999999")
puts empty_row.board_array ==
  [ 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4,
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
     [1,2,3,4,5,6,7,8,9],
    6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8,
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]

empty_col = SudokuBoard.new("120456789120456789120456789120456789120456789120456789120456789120456789120456789")
puts empty_col.board_array ==
  [ 1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9 ]

empty_everything = SudokuBoard.new("0"*81)
puts empty_everything.board_array == Array.new(81, [1,2,3,4,5,6,7,8,9])

####################
# rows and columns #
####################

puts "\nROWS, COLS, & GRIDS!\n\n"

puts "Row Tests:"
row_test = SudokuBoard.new("111111111222222222333333333444444444555555555666666666777777777888888888999999999")
puts row_test.get_row(1) == Array.new(9, 1)
puts row_test.get_row(2) == Array.new(9, 2)
puts row_test.get_row(3) == Array.new(9, 3)
puts row_test.get_row(4) == Array.new(9, 4)
puts row_test.get_row(5) == Array.new(9, 5)
puts row_test.get_row(6) == Array.new(9, 6)
puts row_test.get_row(7) == Array.new(9, 7)
puts row_test.get_row(8) == Array.new(9, 8)
puts row_test.get_row(9) == Array.new(9, 9)
puts

puts "Col Tests:"
col_test = SudokuBoard.new("123456789123456789123456789123456789123456789123456789123456789123456789123456789")
puts col_test.get_col(1) == Array.new(9, 1)
puts col_test.get_col(2) == Array.new(9, 2)
puts col_test.get_col(3) == Array.new(9, 3)
puts col_test.get_col(4) == Array.new(9, 4)
puts col_test.get_col(5) == Array.new(9, 5)
puts col_test.get_col(6) == Array.new(9, 6)
puts col_test.get_col(7) == Array.new(9, 7)
puts col_test.get_col(8) == Array.new(9, 8)
puts col_test.get_col(9) == Array.new(9, 9)
puts

puts "Grid Tests:"
grid_test = SudokuBoard.new("111222333111222333111222333444555666444555666444555666777888999777888999777888999")
puts grid_test.get_grid(1) == Array.new(9, 1)
puts grid_test.get_grid(2) == Array.new(9, 2)
puts grid_test.get_grid(3) == Array.new(9, 3)
puts grid_test.get_grid(4) == Array.new(9, 4)
puts grid_test.get_grid(5) == Array.new(9, 5)
puts grid_test.get_grid(6) == Array.new(9, 6)
puts grid_test.get_grid(7) == Array.new(9, 7)
puts grid_test.get_grid(8) == Array.new(9, 8)
puts grid_test.get_grid(9) == Array.new(9, 9)
