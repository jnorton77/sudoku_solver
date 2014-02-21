goal_9 = "111222333111222333111222333444555666444555666444555666777888999777888999777888999"
goal_4 = "1122112233443344"

def grid(n)
  result = ""
  count = 0
  root = Math.sqrt(n).floor
  (1..n).each_slice(root) do |slice|
    root.times do
      slice.each do |num|
        root.times { result << num.to_s }
      end
    end
  end
  result
end

puts goal_9
puts grid(9)

puts grid(9) == goal_9

puts goal_4
puts grid(4)

puts grid(4) == goal_4
