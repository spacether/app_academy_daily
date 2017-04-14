class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |item, i|
      sum += item.hash * (i + 1)
    end
    sum.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    mapped = self.to_a.map(&:hash)
    mapped.inject(:+)
  end
end
