class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1 if empty?
    arr = map(&:hash)
    sum = 0
    arr.each_with_index do |item, i|
      sum = sum ^ (item + i)
    end
    sum
  end
end

class String
  def hash
    return 2 if empty?
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 3 if empty?
    kv_pairs = self.to_a
    kv_pairs.map!(&:hash)
    kv_pairs.reduce { |sum, item| sum ^ item }
  end
end
