require './SudokuBoard'
### TESTS ###
puts "\nAll Tests Should Evaluate to * TRUE *\n\n"

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

####################################
# rows, columns, and grides OH MY! #
####################################

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

#################################
# row, column, and grid numbers #
#################################

puts "\nROWS, COLS, & GRIDS (number)!\n\n"
no_empties = SudokuBoard.new("111111111222222222333333333444444444555555555666666666777777777888888888999999999")
first_index = (0..8).to_a
second_index = (9..17).to_a
third_index = (18..26).to_a
fourth_index = (27..35).to_a
fifth_index = (36..44).to_a
sixth_index = (45..53).to_a
seventh_index = (54..62).to_a
eigth_index = (63..71).to_a
ninth_index = (72..80).to_a

puts "Get Row Number:"
puts no_empties.get_row_num(first_index.sample)   == 1
puts no_empties.get_row_num(second_index.sample)  == 2
puts no_empties.get_row_num(third_index.sample)   == 3
puts no_empties.get_row_num(fourth_index.sample)  == 4
puts no_empties.get_row_num(fifth_index.sample)   == 5
puts no_empties.get_row_num(sixth_index.sample)   == 6
puts no_empties.get_row_num(seventh_index.sample) == 7
puts no_empties.get_row_num(eigth_index.sample)   == 8
puts no_empties.get_row_num(ninth_index.sample)   == 9
puts

index_1 = [0,  9, 18, 27, 36, 45, 54, 63, 72]
index_2 = [1, 10, 19, 28, 37, 46, 55, 64, 73]
index_3 = [2, 11, 20, 29, 38, 47, 56, 65, 74]
index_4 = [3, 12, 21, 30, 39, 48, 57, 66, 75]
index_5 = [4, 13, 22, 31, 40, 49, 58, 67, 76]
index_6 = [5, 14, 23, 32, 41, 50, 59, 68, 77]
index_7 = [6, 15, 24, 33, 42, 51, 60, 69, 78]
index_8 = [7, 16, 25, 34, 43, 52, 61, 70, 79]
index_9 = [8, 17, 26, 35, 44, 53, 62, 71, 80]

puts "Get Column Number:"
puts no_empties.get_col_num(index_1.sample) == 1
puts no_empties.get_col_num(index_2.sample) == 2
puts no_empties.get_col_num(index_3.sample) == 3
puts no_empties.get_col_num(index_4.sample) == 4
puts no_empties.get_col_num(index_5.sample) == 5
puts no_empties.get_col_num(index_6.sample) == 6
puts no_empties.get_col_num(index_7.sample) == 7
puts no_empties.get_col_num(index_8.sample) == 8
puts no_empties.get_col_num(index_9.sample) == 9
puts

grid_index_1 = [ 0,  1,  2,  9, 10, 11, 18, 19, 20]
grid_index_2 = [ 3,  4,  5, 12, 13, 14, 21, 22, 23]
grid_index_3 = [ 6,  7,  8, 15, 16, 17, 24, 25, 26]
grid_index_4 = [27, 28, 29, 36, 37, 38, 45, 46, 47]
grid_index_5 = [30, 31, 32, 39, 40, 41, 48, 49, 50]
grid_index_6 = [33, 34, 35, 42, 43, 44, 51, 52, 53]
grid_index_7 = [54, 55, 56, 63, 64, 65, 72, 73, 74]
grid_index_8 = [57, 58, 59, 66, 67, 68, 75, 76, 77]
grid_index_9 = [60, 61, 62, 69, 70, 71, 78, 79, 80]

############
# end game #
############

puts "\nTESTS END CONDITIONS!\n\n"

end_board = SudokuBoard.new('0'*81)
end_board.board_array =
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
end_board.solve? == false

exit!
  puts solved?([ 1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9,
    1, 2, [1,2,3,4,5,6,7,8,9], 4, 5, 6, 7, 8, 9 ]) == false

  puts solved?([ 1, 1, 1, 1, 1, 1, 1, 1, 1,
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
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]) == false

  puts solved?([ 1, 1, 1, 1, 1, 1, 1, 1, 1,
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
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]) == false

  puts solved?([ 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8,
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]) == true

###############
# print board #
###############

puts "\nPRINTS THE MoFo BOARD!\n\n"
grid_test = SudokuBoard.new("111222333111222333111222333444555666444555666444555666777888999777888999777888999")

puts grid_test



