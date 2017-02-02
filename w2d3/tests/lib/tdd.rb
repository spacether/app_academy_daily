def my_uniq(arr)
  uniques = []
  arr.each { |el| uniques << el unless uniques.include?(el) }
  uniques
end

class Array

  def two_sum
    res = []
    (0...length - 1).each do |i|
      (i + 1...length).each do |j|
        res << [i,j] if self[i] + self[j] == 0
      end
    end
    res
  end
end

def my_transpose(arr)
  raise ArgumentError unless arr.is_a?(Array)
  res = []
  (arr.length).times { res << [] }

  arr.each_with_index do |row, i|
    row.each_index do |j|
      res[j] << arr[i][j]
    end
  end
  res
end

def stock_picker(arr)
  raise ArgumentError unless arr.is_a?(Array)
  best = [0,1]
  (0..arr.length-2).each do |i|
    (i+1..arr.length-1).each do |j|
      new_trade = tradeval([i,j], arr)
      best = [i, j] if new_trade > tradeval(best, arr)
    end
  end
  best
end

def tradeval(days, arr)
  buy, sell = days
  arr[sell] - arr[buy]
end
