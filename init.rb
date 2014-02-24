require './sudoku'

dec_prob_set = File.readlines('problem_sets/dbc_sudoku.txt').map(&:chomp)
dec_prob_set.each_with_index do |board_seed, index|
  puts "Dev Bootcamp Problem No. #{index+1}"
  SudokuBoard.new(board_seed).solve!
end

projecteuler = File.readlines('problem_sets/projecteuler.txt').map(&:chomp)
projecteuler.each_with_index do |board_seed, index|
  puts "Project Euler Problem No. #{index+1}"
  SudokuBoard.new(board_seed).solve!
end