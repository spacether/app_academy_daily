class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1!(array)
    return array if array.length < 2
    pivot = array[0]
    left = array.drop(1).select { |item| item < pivot }
    right = array.drop(1).select { |item| item >= pivot }
    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return true if length < 2
    # move to left and right
    pivot_idx = self.partition!(array, start, length, &prc)
    self.sort2!(array, start, pivot_idx - start, &prc)
    self.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
  end

  def self.partition!(array, start, length, &prc)
    pivot_val = array[start]
    low_idx = start
    prc ||= Proc.new { |x, y| x <=> y }
    (start + 1...start + length).each do |i|
      if prc.call(array[i], pivot_val) == -1
        if i == low_idx + 1
          low_idx = i
        else
          array[low_idx + 1], array[i] = array[i], array[low_idx + 1]
          low_idx += 1
        end
      end
    end
    array[low_idx], array[start] = array[start], array[low_idx]
    low_idx
  end
end
