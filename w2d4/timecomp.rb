#O(n^2)
def my_min(array)
  smallest = array.first
  array.each do |el1|
    array.each do |el2|
      smallest = el1 if el1 < smallest && el1 < el2
    end
  end
  smallest
end

#O(n)
def my_min_lin(array)
  smallest = array.first
  array.each do |el1|
    smallest = el1 if el1 < smallest
  end
  smallest
end

def larg_cont_sum(arr)
  res = []
  arr.each_index do |i|
    (i..arr.length-1).each do |j|
      res << arr[i..j]
    end
  end
  res.map{ |el| el.reduce(:+) }.max
end
# n^2 + (n^2)*n --> n^3

def lcs_better(arr)
  best_sum = arr.first
  sum = arr.first
  arr.each do |val|
    sum += val
    best_sum = sum if sum > best_sum
    sum = 0 if sum < 0
  end
  best_sum
end

puts lcs_better([1,2,-4,4,-3,4]) == 5
puts lcs_better([-4,-1,-3,-2]) == -1
