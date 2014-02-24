module SudokuBoardOutput
  def print_board(seed=board_seed, final=board_final)
    seed = format_board(seed).each_line.to_a
    seed = seed.unshift("START".center(seed.first.length-1)).map(&:chomp)

    final = format_board(final).each_line.to_a
    final = final.unshift("FINAL".center(seed.first.length) + "\n")

    printable = seed.zip(final).map{|line| line.join('    ')}.join
    puts printable.prepend("\n\n") + "\n\n"
  end

  def format_board(board_str)
    n = 3
    char_pad = 2
    vert_div = ':'
    hori_div = '-'
    empty = '·'
    board_str.gsub!(/0/, empty)
    rows = board_str.scan(/.{#{ n*n }}/).map { |row| format_row(row, n, vert_div) }
    row_length = rows.first.chomp.length
    bundles = rows.each_slice(n).map(&:join)
    bundles.join(hori_div * row_length + "\n")
  end

  def format_row(row, n, vert_div)
    row.scan(/.{#{n}}/).map{|chunk| format_chunk(chunk) }.join(vert_div) + "\n"
  end

  def format_chunk(chunk, padding=1)
    Array.new(chunk.length+1, ' ' * padding).zip(chunk.chars).join
  end
end