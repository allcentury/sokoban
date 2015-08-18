require 'spec_helper'
require_relative '../lib/sokoban'

describe Sokoban do
  it 'solves an easy level moving left' do
    start_of_level = [
      ["#", "#", "#", "#", "#"],
      ["#", ".", "o", "@", "#"],
      ["#", "#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    expect(sokoban.move_down).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level
    expect(sokoban.move_up).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level
    expect(sokoban.move_right).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level

    end_of_level = [
      ["#", "#", "#", "#", "#"],
      ["#", "*", "@", " ", "#"],
      ["#", "#", "#", "#", "#"]
    ]
    sokoban.move_left
    expect(sokoban.level).to eq end_of_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an easy level moving right' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", "@", "o", "."],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    expect(sokoban.move_down).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level
    expect(sokoban.move_up).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level
    expect(sokoban.move_left).to eq "Invalid move"
    expect(sokoban.level).to eq start_of_level

    end_of_level = [
      ["#", "#", "#", "#"],
      ["#", " ", "@", "*"],
      ["#", "#", "#", "#"]
    ]
    sokoban.move_right
    expect(sokoban.level).to eq end_of_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an easy level moving up' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", ".", " ", " "],
      ["#", "o", " ", " "],
      ["#", "@", " ", " "],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_up

    end_of_level = [
      ["#", "#", "#", "#"],
      ["#", "*", " ", " "],
      ["#", "@", " ", " "],
      ["#", " ", " ", " "],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq end_of_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an easy level moving down' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", "@", " ", " "],
      ["#", "o", " ", " "],
      ["#", ".", " ", " "],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_down

    end_of_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", " "],
      ["#", "@", " ", " "],
      ["#", "*", " ", " "],
      ["#", "#", "#", "#"]
    ]
    # valid move
    expect(sokoban.level).to eq end_of_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an medium level' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", " ", "o", "."],
      ["#", "@", " ", " "],
      ["#", "o", " ", " "],
      ["#", ".", " ", " "],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_down
    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", "o", "."],
      ["#", " ", " ", " "],
      ["#", "@", " ", " "],
      ["#", "*", " ", " "],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq false
    sokoban.move_up
    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", "o", "."],
      ["#", "@", " ", " "],
      ["#", " ", " ", " "],
      ["#", "*", " ", " "],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq false

    sokoban.move_up
    current_level = [
      ["#", "#", "#", "#"],
      ["#", "@", "o", "."],
      ["#", " ", " ", " "],
      ["#", " ", " ", " "],
      ["#", "*", " ", " "],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq false

    sokoban.move_right
    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", "@", "*"],
      ["#", " ", " ", " "],
      ["#", " ", " ", " "],
      ["#", "*", " ", " "],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an medium level with items far to push' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", " "],
      ["#", "@", "o", "o"],
      ["#", " ", " ", " "],
      ["#", ".", " ", "."],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_up
    sokoban.move_right
    sokoban.move_right
    sokoban.move_right
    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", "@"],
      ["#", " ", "o", "o"],
      ["#", " ", " ", " "],
      ["#", ".", " ", "."],
      ["#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq false

    sokoban.move_down

    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", " "],
      ["#", " ", "o", "@"],
      ["#", " ", " ", "o"],
      ["#", ".", " ", "."],
      ["#", "#", "#", "#"]
    ]
    expect(sokoban.level).to eq current_level
    expect(sokoban.game_over?).to eq false

    sokoban.move_down
    sokoban.move_up
    sokoban.move_left

    current_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", " "],
      ["#", "o", "@", " "],
      ["#", " ", " ", " "],
      ["#", ".", " ", "*"],
      ["#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq current_level
    sokoban.move_up
    sokoban.move_left
    sokoban.move_down
    sokoban.move_down

    end_level = [
      ["#", "#", "#", "#"],
      ["#", " ", " ", " "],
      ["#", " ", " ", " "],
      ["#", "@", " ", " "],
      ["#", "*", " ", "*"],
      ["#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq end_level
    expect(sokoban.game_over?).to eq true
  end
  it 'solves an medium level with items far to push' do
    start_of_level = [
      ["#", "#", "#", "#"],
      ["#", ".", " ", "."],
      ["#", "@", "o", " "],
      ["#", "o", " ", " "],
      ["#", " ", " ", " "],
      ["#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_right
    sokoban.move_down
    sokoban.move_right
    sokoban.move_up

    current_level = [
      ["#", "#", "#", "#"],
      ["#", ".", " ", "*"],
      ["#", " ", " ", "@"],
      ["#", "o", " ", " "],
      ["#", " ", " ", " "],
      ["#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq current_level

    sokoban.move_down
    sokoban.move_down
    sokoban.move_left
    sokoban.move_left
    sokoban.move_up
    sokoban.move_up

    end_level = [
      ["#", "#", "#", "#"],
      ["#", "*", " ", "*"],
      ["#", "@", " ", " "],
      ["#", " ", " ", " "],
      ["#", " ", " ", " "],
      ["#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq end_level
    expect(sokoban.game_over?).to eq true
  end
  it "doesn't override storage when crossed over" do
    start_of_level = [
      ["#", "#", "#", "#", "#"],
      ["#", ".", " ", ".", "#"],
      ["#", "@", "o", " ", "#"],
      ["#", "o", " ", " ", "#"],
      ["#", " ", " ", " ", "#"],
      ["#", "#", "#", "#", "#"]
    ]
    sokoban = Sokoban.new(start_of_level)
    expect(sokoban.level).to eq start_of_level

    sokoban.move_up
    current_level = [
      ["#", "#", "#", "#", "#"],
      ["#", "+", " ", ".", "#"],
      ["#", " ", "o", " ", "#"],
      ["#", "o", " ", " ", "#"],
      ["#", " ", " ", " ", "#"],
      ["#", "#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq current_level

    sokoban.move_right
    current_level = [
      ["#", "#", "#", "#", "#"],
      ["#", ".", "@", ".", "#"],
      ["#", " ", "o", " ", "#"],
      ["#", "o", " ", " ", "#"],
      ["#", " ", " ", " ", "#"],
      ["#", "#", "#", "#", "#"]
    ]

    expect(sokoban.level).to eq current_level
  end

end
