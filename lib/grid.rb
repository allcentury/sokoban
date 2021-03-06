class Grid
  attr_reader :num, :level
  def initialize(num)
    @num = num
    @level = get_level
  end

  def to_word
    case num
    when "1" then "Easy"
    when "2" then "Medium"
    when "3" then "Hard"
    end
  end

  private

  def get_level
    case num
    when "1" then easy
    when "2" then medium
    when "3" then hard
    end
  end

  def easy
    [
      ["#", "#", "#", "#", "#"],
      ["#", ".", "o", "@", "#"],
      ["#", "#", "#", "#", "#"]
    ]
  end

  def medium
    [
      ["#", "#", "#", "#", "#"],
      ["#", " ", " ", " ", "#"],
      ["#", "@", "o", "o", "#"],
      ["#", " ", " ", " ", "#"],
      ["#", ".", " ", ".", "#"],
      ["#", "#", "#", "#", "#"]
    ]
  end

  def hard
    [
      ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#"],
      ["#", " ", " ", " ", "o", " ", " ", " ", ".", "#"],
      ["#", "@", "o", " ", "o", " ", " ", "o", " ", "#"],
      ["#", " ", " ", ".", " ", " ", "o", " ", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", " ", ".", " ", ".", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", ".", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", ".", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", ".", " ", "#"],
      ["#", " ", ".", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", "o", " ", " ", " ", " ", "#"],
      ["#", ".", " ", " ", "o", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
      ["#", " ", ".", ".", " ", " ", " ", ".", " ", "#"],
      ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#"]
    ]
  end

end



