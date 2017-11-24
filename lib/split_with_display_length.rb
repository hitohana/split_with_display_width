class String
  def split_with_display_length_from_start(num)
    return [self, ''] if num >= self.display_length

    first = []
    second = []
    self.each_char.each do |char|
      tmp = first + [char]
      if tmp.join.display_length <= num
        first << char
      else
        second << char
      end
    end

    [first.join, second.join]
  end

  def split_with_display_length_from_end(num)
    return ['', self] if num >= self.display_length

    first = []
    second = []
    self.each_char.to_a.reverse.each do |char|
      tmp = second + [char]
      if tmp.join.display_length <= num
        second << char
      else
        first << char
      end
    end

    [first.reverse.join, second.reverse.join]
  end
end

