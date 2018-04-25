class TictacMatch

  def initialize
    @fields = ['0', '1', '2', '3', '4', '5', '6', '7', '8']
  end

  def print_board
    puts "#{@fields[0]} | #{@fields[1]} | #{@fields[2]}"
    puts "#{@fields[3]} | #{@fields[4]} | #{@fields[5]}"
    puts "#{@fields[6]} | #{@fields[7]} | #{@fields[8]}"
  end

  def play(field, marker)
    return false unless (0..8).include?(field) && /\d/ =~ @fields[field]
    @fields[field] = marker
  end

  def over?
    if @fields[0] == @fields[1] && @fields[1] == @fields[2] ||
       @fields[3] == @fields[4] && @fields[4] == @fields[5] ||
       @fields[6] == @fields[7] && @fields[7] == @fields[8] ||
       @fields[0] == @fields[3] && @fields[3] == @fields[6] ||
       @fields[1] == @fields[4] && @fields[4] == @fields[7] ||
       @fields[2] == @fields[5] && @fields[5] == @fields[8] ||
       @fields[0] == @fields[4] && @fields[4] == @fields[8] ||
       @fields[2] == @fields[4] && @fields[4] == @fields[6]
      return true
    end
  end

end

loop do
  game = TictacMatch.new
  9.times do |i|
    game.print_board
    i % 2 == 0 ? turn = 'X' : turn = 'O'
    loop do
      print "#{turn}, pick a field to make your move: "
      field = gets.chomp
      break if game.play(field.to_i, turn)
      puts 'Invalid move.'
    end
    if game.over?
      game.print_board
      puts "#{turn} won!"
      break
    end
  end
end
