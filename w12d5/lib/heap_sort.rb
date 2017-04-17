require_relative "heap"

class Array
  def heap_sort!
    return self if length < 2
    bheap = BinaryMinHeap.new
    self.each do |item|
      bheap.push(item)
    end
    (0..length - 1).each do |ind|
      item = bheap.extract
      self[ind] = item
    end
    self
  end
end
