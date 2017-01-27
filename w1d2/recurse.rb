# Justin Black
# w1d2 AppAcademy HW

# starting at 8:35 pm

def sum_to(n)
  return nil if n < 0
  return 1 if n == 1
  sum_to(n - 1) + n
end

puts "sum_to tests"
p sum_to(5) == 15
p sum_to(1) == 1
p sum_to(9) == 45
p sum_to(-8) == nil

# 8:41 finished problem 1, 6 mins
# 8:43 starting problem 2

def add_numbers(arr)
  return nil if arr.empty?
  return arr.first if arr.length == 1
  arr.first + add_numbers(arr[1..-1])
end

puts "add_numbers tests"
p add_numbers([1, 2, 3, 4]) == 10
p add_numbers([3]) == 3
p add_numbers([-80, 34, 7]) == -39
p add_numbers([]) == nil

# done at 8:48, 5 mins
# starting at 8:49

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

puts "gamma_func tests"
p gamma_fnc(0) == nil
p gamma_fnc(1) == 1
p gamma_fnc(4) == 6
p gamma_fnc(8) == 5040

# done at 8:54 pm, 5 minutes
