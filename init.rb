require './sudoku'
# # # ### ORIGINAL DRIVER CODE ###

unsolved_problems = File.readlines('problem_sets/dbc_sudoku.txt').map(&:chomp)
unsolved_problems.each_with_index do |board_seed, index|
  puts "Problem number #{index+1}"
  puts board_seed
  puts
  game = SudokuBoard.new(board_seed)
  puts "Before:"
  game.print_board
  puts
  puts "After:"
  game.solve!
  puts
  puts
end

# test = SudokuBoard.new("8000000000036000000700902000500070000000100030001000068008500010090000400")
# puts board_seed
# puts "Before:"
# test.print_board
# puts
# puts "After:"
# test.solve!