module SudokuBoardOutput
  def print_board
    vert_div = ':'
    hori_div = '-'
    pad_width = 2
    width = nil
    str = ''
    board = board_array.map{|x| x.is_a?(Array) ? " " : x }.each_slice(3).to_a.each_slice(3).to_a.each_slice(3).to_a
    board.each do |stack|
      stack.each do |line|
        line_str = ' '
        line.each do |triplet|
          triplet.each {|num| line_str << "#{num}".ljust(pad_width) }
          line_str << vert_div.ljust(pad_width)
        end
        (pad_width + 1).times {line_str.chop!}
        width = "#{line_str}\n".length
        str << "#{line_str}\n"
      end
      str << hori_div * width + "\n"
    end
    str = hori_div * width + "\n" + str
    puts str
  end

  alias_method :to_s, :print_board
end