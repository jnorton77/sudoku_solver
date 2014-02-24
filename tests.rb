require './sudoku'
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
# rows, columns, and boxes OH MY! #
####################################

puts "\nROWS, COLS, & BOXES!\n\n"

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

puts "Box Tests:"
box_test = SudokuBoard.new("111222333111222333111222333444555666444555666444555666777888999777888999777888999")
puts box_test.get_box(1) == Array.new(9, 1)
puts box_test.get_box(2) == Array.new(9, 2)
puts box_test.get_box(3) == Array.new(9, 3)
puts box_test.get_box(4) == Array.new(9, 4)
puts box_test.get_box(5) == Array.new(9, 5)
puts box_test.get_box(6) == Array.new(9, 6)
puts box_test.get_box(7) == Array.new(9, 7)
puts box_test.get_box(8) == Array.new(9, 8)
puts box_test.get_box(9) == Array.new(9, 9)

#################################
# row, column, and box numbers #
#################################

puts "\nROW, COL, & BOX NUMBERS!\n\n"
no_empties = SudokuBoard.new("111111111222222222333333333444444444555555555666666666777777777888888888999999999")
row_index_1 = ( 0.. 8).to_a
row_index_2 = ( 9..17).to_a
row_index_3 = (18..26).to_a
row_index_4 = (27..35).to_a
row_index_5 = (36..44).to_a
row_index_6 = (45..53).to_a
row_index_7 = (54..62).to_a
row_index_8 = (63..71).to_a
row_index_9 = (72..80).to_a

puts "Get Row Number:"
puts row_index_1.all?{ |row_num| no_empties.get_row_num(row_num) == 1 }
puts row_index_2.all?{ |row_num| no_empties.get_row_num(row_num) == 2 }
puts row_index_3.all?{ |row_num| no_empties.get_row_num(row_num) == 3 }
puts row_index_4.all?{ |row_num| no_empties.get_row_num(row_num) == 4 }
puts row_index_5.all?{ |row_num| no_empties.get_row_num(row_num) == 5 }
puts row_index_6.all?{ |row_num| no_empties.get_row_num(row_num) == 6 }
puts row_index_7.all?{ |row_num| no_empties.get_row_num(row_num) == 7 }
puts row_index_8.all?{ |row_num| no_empties.get_row_num(row_num) == 8 }
puts row_index_9.all?{ |row_num| no_empties.get_row_num(row_num) == 9 }
puts

col_index_1 = [0,  9, 18, 27, 36, 45, 54, 63, 72]
col_index_2 = [1, 10, 19, 28, 37, 46, 55, 64, 73]
col_index_3 = [2, 11, 20, 29, 38, 47, 56, 65, 74]
col_index_4 = [3, 12, 21, 30, 39, 48, 57, 66, 75]
col_index_5 = [4, 13, 22, 31, 40, 49, 58, 67, 76]
col_index_6 = [5, 14, 23, 32, 41, 50, 59, 68, 77]
col_index_7 = [6, 15, 24, 33, 42, 51, 60, 69, 78]
col_index_8 = [7, 16, 25, 34, 43, 52, 61, 70, 79]
col_index_9 = [8, 17, 26, 35, 44, 53, 62, 71, 80]

puts "Get Col Number:"
puts col_index_1.all?{ |col_num| no_empties.get_col_num(col_num) == 1 }
puts col_index_2.all?{ |col_num| no_empties.get_col_num(col_num) == 2 }
puts col_index_3.all?{ |col_num| no_empties.get_col_num(col_num) == 3 }
puts col_index_4.all?{ |col_num| no_empties.get_col_num(col_num) == 4 }
puts col_index_5.all?{ |col_num| no_empties.get_col_num(col_num) == 5 }
puts col_index_6.all?{ |col_num| no_empties.get_col_num(col_num) == 6 }
puts col_index_7.all?{ |col_num| no_empties.get_col_num(col_num) == 7 }
puts col_index_8.all?{ |col_num| no_empties.get_col_num(col_num) == 8 }
puts col_index_9.all?{ |col_num| no_empties.get_col_num(col_num) == 9 }
puts

box_index_1 = [ 0,  1,  2,  9, 10, 11, 18, 19, 20]
box_index_2 = [ 3,  4,  5, 12, 13, 14, 21, 22, 23]
box_index_3 = [ 6,  7,  8, 15, 16, 17, 24, 25, 26]
box_index_4 = [27, 28, 29, 36, 37, 38, 45, 46, 47]
box_index_5 = [30, 31, 32, 39, 40, 41, 48, 49, 50]
box_index_6 = [33, 34, 35, 42, 43, 44, 51, 52, 53]
box_index_7 = [54, 55, 56, 63, 64, 65, 72, 73, 74]
box_index_8 = [57, 58, 59, 66, 67, 68, 75, 76, 77]
box_index_9 = [60, 61, 62, 69, 70, 71, 78, 79, 80]

puts "Get Box Number:"
puts box_index_1.all?{ |box_num| no_empties.get_box_num(box_num) == 1 }
puts box_index_2.all?{ |box_num| no_empties.get_box_num(box_num) == 2 }
puts box_index_3.all?{ |box_num| no_empties.get_box_num(box_num) == 3 }
puts box_index_4.all?{ |box_num| no_empties.get_box_num(box_num) == 4 }
puts box_index_5.all?{ |box_num| no_empties.get_box_num(box_num) == 5 }
puts box_index_6.all?{ |box_num| no_empties.get_box_num(box_num) == 6 }
puts box_index_7.all?{ |box_num| no_empties.get_box_num(box_num) == 7 }
puts box_index_8.all?{ |box_num| no_empties.get_box_num(box_num) == 8 }
puts box_index_9.all?{ |box_num| no_empties.get_box_num(box_num) == 9 }
puts

############
# end game #
############

puts "\nTESTS END CONDITIONS!\n\n"
puts "Method#solved?"
end_board = SudokuBoard.new('0'*81)

end_board.board_array =
  [ [1,1], 1, 1, 1, 1, 1, 1, 1, 1,
    2    , 2, 2, 2, 2, 2, 2, 2, 2,
    3    , 3, 3, 3, 3, 3, 3, 3, 3,
    4    , 4, 4, 4, 4, 4, 4, 4, 4,
    5    , 5, 5, 5, 5, 5, 5, 5, 5,
    6    , 6, 6, 6, 6, 6, 6, 6, 6,
    7    , 7, 7, 7, 7, 7, 7, 7, 7,
    8    , 8, 8, 8, 8, 8, 8, 8, 8,
    9    , 9, 9, 9, 9, 9, 9, 9, 9 ]
puts end_board.solved? == false

end_board.board_array =
  [ [], 1, 1, 1, 1, 1, 1, 1, 1,
    2 , 2, 2, 2, 2, 2, 2, 2, 2,
    3 , 3, 3, 3, 3, 3, 3, 3, 3,
    4 , 4, 4, 4, 4, 4, 4, 4, 4,
    5 , 5, 5, 5, 5, 5, 5, 5, 5,
    6 , 6, 6, 6, 6, 6, 6, 6, 6,
    7 , 7, 7, 7, 7, 7, 7, 7, 7,
    8 , 8, 8, 8, 8, 8, 8, 8, 8,
    9 , 9, 9, 9, 9, 9, 9, 9, 9 ]
puts end_board.solved? == false

end_board.board_array =
  [ 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8,
    9, 9, 9, 9, 9, 9, 9, 9, 9 ]
puts end_board.solved? == true

#########################
# solve and print board #
#########################

puts "\nSOLVES AND PRINTS THE MoFo BOARD!\n\n"
box_test = SudokuBoard.new("302609005500730000000000900000940000000000109000057060008500006000000003019082040")
puts "Before Solve:"
box_test.print_board
puts "seed:  #{box_test.board_seed}"
puts "final: #{box_test.board_final}"
puts box_test.board_seed == box_test.board_final
puts
puts
box_test.solve
puts "After Solve:"
box_test.print_board
puts "seed:  #{box_test.board_seed}"
puts "final: #{box_test.board_final}"
puts pass = box_test.board_final == "382619475594738621176425938863941752457263189921857364738594216245176893619382547"
puts pass ? "\nSudoku... like a BOSS!!!\n\n" : "\nWhoops! You done f*cked up now.\n\n"
