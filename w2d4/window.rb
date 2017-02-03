
# O(n^2) probably this
# if tiny doesn't matter O(n)
def naive_window(arr, size)
  cur_max = 0
  (0..arr.length-size).each do |i|
    window = arr[i...i+size]
    range = window.max - window.min
    cur_max = range if range > cur_max
  end
  cur_max
end

p naive_window([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_window([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_window([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_window([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(item)
    @store << item
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end



class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(item)
    @store << item
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end


class StackQueue

  def initialize
    @upper = MyStack.new
    @lower = Mystack.new
    @maxes = []
    @mins = []
  end

  def enqueue(item)
    @upper.push(item)
  end

  def dequeue
    unless @lower.empty?
      @lower.pop
    else
      @upper.size.times do
        val = @upper.pop
        @lower.push(val)
      end
      @lower.pop
    end
  end

  def set_max(val)
    case maxes.length
    when 0
      @maxes << val
    when 1
      @maxes.unshift(val) if val > @maxes.first
      @maxes << val if val < @maxes.first
      else

      end
    when 2
      if val > @maxes.first
        @maxes.unshift(val)
        @maxes.pop if @maxes.length > 2

      end
    end
  end

  def set_min(val)
    if @mins.empty?
      @mins << val
    else
      if val > @maxes.first
        @maxes.unshift(val)
        @maxes.pop if @maxes.length > 2
      end
    end
  end

  def size
    @upper.size + @lower.size
  end

  def max
  end

  def min
  end

  def empty?
    size.zero?
  end

end
