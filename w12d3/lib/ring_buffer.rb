require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start = 0 #start index
    @length = 0 # length size
  end

  # O(1)
  def [](index)
    real_ind = real_index(index)
    @store[real_ind]
  end

  # O(1)
  def []=(index, val)
    real_ind = real_index(index)
    @store[real_ind] = val
  end

  # O(1)
  def pop
    index = real_index(@length - 1)
    popped = @store[index]
    @store[index] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize!
    @length += 1
    index = real_index(@length - 1)
    @store[index] = val
  end

  # O(1)
  def shift
    index = real_index(0)
    shifted = @store[index]
    @store[@start] = nil
    @start += 1
    @length -= 1
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize!
    @start -= 1
    @length += 1
    index = real_index(0)
    @store[index] = val
  end

  protected

  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def real_index(index)
    check_index(index)
    (@start + index) % @capacity
  end

  def check_index(index)
    out_of_range = index.abs >= @length
    raise "index out of bounds" if out_of_range
  end

  def resize!
    if @length == @capacity
      new_capacity = @capacity * 2
      new_arr = StaticArray.new(new_capacity)

      (0...@length).each do |ind|
        value = self[ind]
        new_ind = (@start + ind) % new_capacity
        new_arr[new_ind] = value
      end

      @store = new_arr
      @capacity = new_capacity
    end
  end
end
