require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(item)
    unless include?(item)
      resize! if @count == num_buckets
      @count += 1
      self[item] << item
    end
  end

  def include?(item)
    self[item].include?(item)
  end

  def remove(item)
    if include?(item)
      self[item].delete(item)
      @count -= 1
    end
  end

  private

  def [](item)
    idx = item.hash % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    gathered = []
    # 2*n --> O(n)
    (0...num_buckets).each do |i|
      gathered.concat(@store[i].slice!(0..-1))
    end
    @store.concat(Array.new(num_buckets) { [] } )
    @count = 0
    gathered.each do |el|
      self[el] << el
      @count += 1
    end
  end

end
