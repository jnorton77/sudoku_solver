# accepts an index of the board
# returns the index of that row
def get_row_num(index) # returns row_num
  (index / 9) + 1  # => 1, 2, 3, 4, 5, 6, 7, 8, 9
end

def get_col_num(index)
  (index % 9) + 1       # => 1, 2, 3, 4, 5, 6, 7, 8, 9
end



# Tests
first_index = (0..8).to_a      # => [0, 1, 2, 3, 4, 5, 6, 7, 8]
second_index = (9..17).to_a    # => [9, 10, 11, 12, 13, 14, 15, 16, 17]
third_index = (18..26).to_a    # => [18, 19, 20, 21, 22, 23, 24, 25, 26]
fourth_index = (27..35).to_a   # => [27, 28, 29, 30, 31, 32, 33, 34, 35]
fifth_index = (36..44).to_a    # => [36, 37, 38, 39, 40, 41, 42, 43, 44]
sixth_index = (45..53).to_a    # => [45, 46, 47, 48, 49, 50, 51, 52, 53]
seventh_index = (54..62).to_a  # => [54, 55, 56, 57, 58, 59, 60, 61, 62]
eigth_index = (63..71).to_a    # => [63, 64, 65, 66, 67, 68, 69, 70, 71]
ninth_index = (72..80).to_a    # => [72, 73, 74, 75, 76, 77, 78, 79, 80]

puts "get_row_num TESTS:"                 # => nil
p get_row_num(first_index.sample) == 1    # => true
p get_row_num(second_index.sample) == 2   # => true
p get_row_num(third_index.sample) == 3    # => true
p get_row_num(fourth_index.sample) == 4   # => true
p get_row_num(fifth_index.sample) == 5    # => true
p get_row_num(sixth_index.sample) == 6    # => true
p get_row_num(seventh_index.sample) == 7  # => true
p get_row_num(eigth_index.sample) == 8    # => true
p get_row_num(ninth_index.sample) == 9    # => true

index_1 = [0, 9, 18, 27, 36, 45, 54, 63, 72]   # => [0, 9, 18, 27, 36, 45, 54, 63, 72]
index_2 = [1, 10, 19, 28, 37, 46, 55, 64, 73]  # => [1, 10, 19, 28, 37, 46, 55, 64, 73]
index_3 = [2, 11, 20, 29, 38, 47, 56, 65, 74]  # => [2, 11, 20, 29, 38, 47, 56, 65, 74]
index_4 = [3, 12, 21, 30, 39, 48, 57, 66, 75]  # => [3, 12, 21, 30, 39, 48, 57, 66, 75]
index_5 = [4, 13, 22, 31, 40, 49, 58, 67, 76]  # => [4, 13, 22, 31, 40, 49, 58, 67, 76]
index_6 = [5, 14, 23, 32, 41, 50, 59, 68, 77]  # => [5, 14, 23, 32, 41, 50, 59, 68, 77]
index_7 = [6, 15, 24, 33, 42, 51, 60, 69, 78]  # => [6, 15, 24, 33, 42, 51, 60, 69, 78]
index_8 = [7, 16, 25, 34, 43, 52, 61, 70, 79]  # => [7, 16, 25, 34, 43, 52, 61, 70, 79]
index_9 = [8, 17, 26, 35, 44, 53, 62, 71, 80]  # => [8, 17, 26, 35, 44, 53, 62, 71, 80]

puts "get_col_num TESTS:"           # => nil
p get_col_num(index_1.sample) == 1  # => true
p get_col_num(index_2.sample) == 2  # => true
p get_col_num(index_3.sample) == 3  # => true
p get_col_num(index_4.sample) == 4  # => true
p get_col_num(index_5.sample) == 5  # => true
p get_col_num(index_6.sample) == 6  # => true
p get_col_num(index_7.sample) == 7  # => true
p get_col_num(index_8.sample) == 8  # => true
p get_col_num(index_9.sample) == 9  # => true

grid_index_1 = [0, 1, 2, 9, 10, 11, 18, 19, 20]      # => [0, 1, 2, 9, 10, 11, 18, 19, 20]
grid_index_2 = [3, 4, 5, 12, 13, 14, 21, 22, 23]     # => [3, 4, 5, 12, 13, 14, 21, 22, 23]
grid_index_3 = [6, 7, 8, 15, 16, 17, 24, 25, 26]     # => [6, 7, 8, 15, 16, 17, 24, 25, 26]
grid_index_4 = [27, 28, 29, 36, 37, 38, 45, 46, 47]  # => [27, 28, 29, 36, 37, 38, 45, 46, 47]
grid_index_5 = [30, 31, 32, 39, 40, 41, 48, 49, 50]  # => [30, 31, 32, 39, 40, 41, 48, 49, 50]
grid_index_6 = [33, 34, 35, 42, 43, 44, 51, 52, 53]  # => [33, 34, 35, 42, 43, 44, 51, 52, 53]
grid_index_7 = [54, 55, 56, 63, 64, 65, 72, 73, 74]  # => [54, 55, 56, 63, 64, 65, 72, 73, 74]
grid_index_8 = [57, 58, 59, 66, 67, 68, 75, 76, 77]  # => [57, 58, 59, 66, 67, 68, 75, 76, 77]
grid_index_9 = [60, 61, 62, 69, 70, 71, 78, 79, 80]  # => [60, 61, 62, 69, 70, 71, 78, 79, 80]

def get_grid_num(index)
  i = index           # => 1, 4, 7, 0, 4, 7, 2, 4, 8
  if i % 3 == 0          # => false, false, false, true, false, false, false, false, false
     i / 3               # => 0
  elsif i % 3 == 1       # => true, true, true, true, true, false, true, false
     (i-1) / 3           # => 0, 1, 2, 1, 2, 1
  elsif i % 3 == 2       # => true, true
     (i-2) /3            # => 0, 2
   end                   # => 0, 1, 2, 0, 1, 2, 0, 1, 2




end

puts "get_grid_num TESTS:"  # => nil
p get_grid_num(grid_index_1.sample) # == 1
p get_grid_num(grid_index_2.sample) # == 2
p get_grid_num(grid_index_3.sample) # == 3
p get_grid_num(grid_index_4.sample) # == 4
p get_grid_num(grid_index_5.sample) # == 5
p get_grid_num(grid_index_6.sample) # == 6
p get_grid_num(grid_index_7.sample) # == 7
p get_grid_num(grid_index_8.sample) # == 8
p get_grid_num(grid_index_9.sample) # == 9




# >> get_row_num TESTS:
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> get_col_num TESTS:
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> true
# >> get_grid_num TESTS:
# >> 0
# >> 1
# >> 2
# >> 0
# >> 1
# >> 2
# >> 0
# >> 1
# >> 2
