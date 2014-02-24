require './sudoku'

unsolved_problems = File.readlines('problem_sets/dbc_sudoku.txt').map(&:chomp)
unsolved_problems.each_with_index do |board_seed, index|
  puts "Problem number #{index+1}"
  SudokuBoard.new(board_seed).solve!
end