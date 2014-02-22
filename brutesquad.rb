
def brute_squad

  @dup_board_array = [7, [3, 4], 2, 6, 8, 9, 1, [3, 4], [3, 4, 5], 8, [3, 4], 6, [1, 5], [5, 7], [1, 4, 7], [3, 4, 5, 7], 2, 9, 1, 5, 9, 3, [2, 7], [2, 4, 7], [4, 6, 7], [4, 7], 8, 4, [1, 7], 3, [1, 8, 9], [6, 7, 9], [1, 6, 7, 8], [2, 6, 7], 5, [2, 6, 7], 2, [1, 7], 8, [1, 9], [3, 6, 7, 9], 5, [3, 4, 6, 7], [3, 4, 7, 9], [3, 4, 6, 7], 6, 9, 5, 2, 4, [3, 7], 8, [3, 7], 1, 3, 8, 4, 7, [2, 5, 6], [2, 6], 9, 1, [2, 5], 5, 2, 1, [8, 9], [3, 9], [3, 8], [3, 4, 7], 6, [3, 4, 7], 9, 6, 7, 4, 1, [2, 3, 8], [2, 3, 5], [3, 8], [2, 3, 5]]
  first_array_index = @dup_board_array.index{ |index| index.is_a?(Array) && index.length == 2 }
  guess_1 = @dup_board_array[first_array_index].shift
  guess_2 = @dup_board_array[first_array_index].pop
  @dup_board_array[first_array_index] = guess_1
  guess_seed = @dup_board_array.map {|element| element.is_a?(Array) ? element = 0 : element}
  guess_seed.join("")
  #branch = self.class.new('guess_seed')
  #branch.solve!
  # if branch.is_this_impossible?
end

brute_squad  # => "732689100806000029159300008403000050208005000695240801384700910521000060967410000"
