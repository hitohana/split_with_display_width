require 'unicode/display_width'

class String
  def split_with_display_width_from_start(num)
    return [self, ''] if num >= self.display_width

    first = []
    second = []
    self.each_char.each do |char|
      tmp = first + [char]
      if tmp.join.display_width <= num
        first << char
      else
        second << char
      end
    end

    [first.join, second.join]
  end

  def split_with_display_width_from_end(num)
    return ['', self] if num >= self.display_width

    first = []
    second = []
    self.each_char.to_a.reverse.each do |char|
      tmp = second + [char]
      if tmp.join.display_width <= num
        second << char
      else
        first << char
      end
    end

    [first.reverse.join, second.reverse.join]
  end
end

