require 'byebug'

arr = [0, 1, 5, 7]

#O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, idx|
    missing = (target_sum - el1)
    arr[idx+1..-1].each do |el2|
      return true if el2 == missing
    end
  end
  false
end
puts "Quadratic"
puts bad_two_sum?(arr, 6) == true
puts bad_two_sum?(arr, 10) == false

# O( n*log(n) )
def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el, i|
    missing = (target - el)
    fixed_arr = arr.dup
    fixed_arr.delete_at(i)
    return true if bsearch(fixed_arr, missing)
  end
  false
end

def bsearch(arr, targ)
  return false if arr.length < 1
  mid = arr.length / 2
  return true if arr[mid] == targ
  return bsearch(arr.take(mid), targ) if targ < arr[mid]
  return bsearch(arr.drop(mid+1), targ) if targ > arr[mid]
  false
end

puts "Linearithmic"
puts okay_two_sum?(arr, 6) == true
puts okay_two_sum?(arr, 10) == false


#O(n)
def two_sum?(arr, target_sum)
  counts = Hash.new(0)
  arr.each { |val| counts[val] += 1 }
  arr.each do |val|
    missing = (target_sum - val)
    if counts.key?(missing)
      if missing == val
        return true if counts[val] > 1
      else
        return true
      end
    end
  end
  false
end

puts "Linear"
puts two_sum?(arr, 6) == true
puts two_sum?(arr, 10) == false
