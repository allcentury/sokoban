require 'pry'
require_relative 'grid'
class Sokoban
  attr_reader :man
  attr_accessor :level
  def initialize(start_grid)
    @level = start_grid
    @man = Man.new(find_man)
  end

  def key(input)
    case input
    when "u" then move_up
    when "d" then move_down
    when "l" then move_left
    when "r" then move_right
    end

  end

  def move_down
    move(1, 0)
  end

  def move_up
    move(-1, 0)
  end

  def move_right
    move(0, 1)
  end

  def move_left
    move(0, -1)
  end

  def game_over?
    level.flatten.none? { |el| el == "o" }
  end

  def print_level
    puts "_" * level[0].size
    level.each do |row|
      row.each { |el| print el }
      puts
    end
    puts "_" * level[0].size
  end


  private

  def move(x, y)
    man.row, man.col = find_man[0], find_man[1]
    destination = level[man.row + x][man.col + y]

    case destination
    when "#"
      return "Invalid move"
    when "o", "*"
      destination2 = level[man.row + (x * 2)][man.col + (y * 2)]
      if destination2 == " "
        level[man.row + (x * 2)][man.col + (y * 2)] = "o"
      elsif destination2 == "."
        level[man.row + (x * 2)][man.col + (y * 2)] = "*"
      else
        return
      end
      destination = (destination == "o") ? " " : "."
    when nil
      return
    end

    level[x + man.row][y + man.col] = if destination == " " || destination == "@"
                                        "@"
                                      else
                                        "+"
                                      end
    level[man.row][man.col] = (level[man.row][man.col] == "@") ? " " : "."
  end

  def find_man
    level.each_with_index do |row, i|
      row.each_with_index do |col, j|
        return i, j if col == "@" || col == "+"
      end
    end
  end

  class Man
    attr_accessor :row, :col, :char
    def initialize(pos)
      @row, @col = pos[0], pos[1]
    end
  end
end
