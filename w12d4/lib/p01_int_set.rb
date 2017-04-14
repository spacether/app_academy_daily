class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max+1) { false }
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !self.include?(num)
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      resize! if @store.length == @count + 1
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # we will need to resize once we add the next item
    allvals = []
    @store.each { |bucket| allvals.concat(bucket) }
    @store = Array.new(@store.length * 2) { Array.new }
    allvals.each { |val| self[val] << val }
  end
end
