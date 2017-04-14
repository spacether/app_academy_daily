require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      resize! if @store.length == @count + 1
      self[key] << key.hash
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key.hash)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key.hash)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num.hash % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    allvals = []
    @store.each { |bucket| allvals.concat(bucket) }
    @store = Array.new(@store.length * 2) { Array.new }
    allvals.each { |val| self[val] << val }
  end
end
