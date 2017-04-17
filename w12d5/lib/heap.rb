class BinaryMinHeap
  def initialize(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    @prc = prc
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    item = @store.pop
    @store = self.class.heapify_down(@store, 0, count, &@prc)
    item
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    len = count
    @store = self.class.heapify_up(@store, len - 1, len, &@prc)
  end

  protected

  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    const = 2 * parent_index
    [const + 1, const + 2].select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    arr = array.dup
    swapped = true
    until !swapped
      inds = self.child_indices(len, parent_idx)
      break if inds.empty?
      child_idx = inds.first
      if inds.length > 1
        left, right = inds
        child_idx = prc.call(arr[right], arr[left]) > 0 ? left : right
      end
      swapped = false
      if prc.call(arr[parent_idx], arr[child_idx]) > 0
        arr[child_idx], arr[parent_idx] = arr[parent_idx], arr[child_idx]
        parent_idx = child_idx
        swapped = true
      end
    end
    arr
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |x, y| x <=> y }
    arr = array.dup
    swapped = true
    until !swapped
      parent_idx = self.parent_index(child_idx)
      swapped = false
      if prc.call(arr[parent_idx], arr[child_idx]) > 0
        arr[child_idx], arr[parent_idx] = arr[parent_idx], arr[child_idx]
        child_idx = parent_idx
        swapped = child_idx == 0 ? false : true
      end
    end
    arr
  end
end
