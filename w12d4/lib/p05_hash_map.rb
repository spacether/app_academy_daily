require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    status = bucket.update(key, val)
    if status.nil?
      bucket.append(key, val)
      @count += 1
      resize! if @count == @store.length - 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    status = bucket(key).remove(key)
    @count -= 1 unless status.nil?
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield [link.key, link.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    allvals = []
    each { |pair| allvals << pair }
    @store = Array.new(@store.length * 2) { LinkedList.new }
    allvals.each do |key, val|
      bucket(key).append(key, val)
    end
    allvals = []
    each { |pair| allvals << pair }
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    index = key.hash % @store.length
    @store[index]
  end
end
