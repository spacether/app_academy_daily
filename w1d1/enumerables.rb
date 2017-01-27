class Array

  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call( self[idx] )
      idx += 1
    end
    self
  end

  def my_select(&prc)
    self.my_each { |e| e if prc.call(e) }
  end

  def my_reject(&prc)
    self.my_each { |e| e if !prc.call(e) }
  end

  def my_any?(&prc)
    self.my_each { |e| return true if prc.call(e) }
    false
  end

  def my_all?(&prc)
    self.my_each { |e| return false if !prc.call(e) }
    true
  end

  def my_flatten
    res = []
    self.each do |item|
      if item.is_a?(Integer)
        res << item
      else
        res += item.my_flatten
      end
    end
    res
  end

  def my_zip(a, b)
    res = []
    (0...self.length).each do |e|
      res << [self[e], a[e], b[e]]
    end
    res
  end

  def my_rotate(shift = 1)
    shift = shift % self.length
    left = self[shift..-1]
    right = self[0... shift]
    left + right
  end

  def my_join(join = "")
    res = ""
    self.each_with_index do |c, i|
      res += c
      res += join if i != self.length - 1
    end
    res
  end

  def my_reverse
    res = []
    self.each { |e| res.unshift(e) }
    res
  end

end

def factors(num)
  res = []
  (1..num).each { |i| res << i if (num % i).zero? }
  res
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    moved = true
    until !moved
      moved = false
      (0...self.length - 1).each do |e|
        low, high = self[e], self[e + 1]
        swap = prc.call(low, high)
        if swap == 1
          self[e + 1], self[e] = self[e], self[e + 1]
          moved = true
        end
      end

    end
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    moved = true
    until !moved
      moved = false
      (0...arr.length - 1).each do |e|
        low, high = arr[e], arr[e + 1]
        swap = prc.call(low, high)
        if swap == 1
          arr[e + 1], arr[e] = arr[e], arr[e + 1]
          moved = true
        end
      end
    end
    arr
  end

end

def substrings(string)
  res = []
  idx1 = 0
  while idx1 < string.length
    idx2 = idx1
    while idx2 < string.length
      if idx1 == idx2
        res << string[idx1]
      else
        res << string[idx1..idx2]
      end
      idx2 += 1
    end
    idx1 += 1
  end
  res.uniq
end

def subwords(word, dictionary)
  dictionary.select { |e| word.include?(e) }.uniq
end
