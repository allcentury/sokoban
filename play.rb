require_relative 'lib/sokoban'

answer = ""
puts "Welcome to Sokoban!"
puts """
Select a difficulty
      \t 1. Easy
      \t 2. Medium
      \t 3. Hard
"""
grid = Grid.new(gets.chomp)
sokoban = Sokoban.new(grid.level)

puts "Game started with a level of #{grid.to_word}"
puts "Here is your level, good luck!"
puts sokoban.print_level


loop do
  puts "Please select your next move: (u, d, l, r) or exit"
  answer = gets.chomp
  break if answer == "exit"
  movement = sokoban.key(answer)
  if movement == "Invalid move"
    puts "You are not able to move that direction, please select another direction"
  else
    75.times { puts } # clear screen
    sokoban.print_level
  end

  if sokoban.game_over?
    puts "YOU WON!"
    break
  end
end
