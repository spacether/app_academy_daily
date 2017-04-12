require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[index] = val
  end

  # O(1)
  def pop
    index = @length - 1
    check_index(index)
    popped = @store[index]
    @store[@length] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize!
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    index = 0
    check_index(index)
    shifted = @store[index]
    (0...@length).each do |ind|
      @store[ind] = @store[ind + 1]
    end
    @store[@length] = nil
    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize!
    (@length - 1).downto(0).each do |ind|
      @store[ind + 1] = @store[ind]
    end
    @store[0] = val
    @length += 1
    @store
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length || index + @length < 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    if @length == @capacity
      @capacity = @capacity * 2
      new_arr = StaticArray.new(@capacity)
      (0...@capacity).each do |ind|
        new_arr[ind] = @store[ind]
      end
      @store = new_arr
    end
  end
end
