require 'byebug'

# O(n!) n! = (n)*(n-1)...
def first_anagrams(str)
  permuations(str.chars).map(&:join)
end

def permuations(str_arr)
  return [str_arr] if str_arr.length < 2
  res = []
  str_arr.each_index do |i|
    letter = str_arr[i]
    small_arr = str_arr.dup
    small_arr.delete_at(i)
    #byebug
    perms = permuations(small_arr)
    perms.each do |perm|
      res << [letter] + perm
    end
  end
  res
end

def anagram?(word1, word2)
  anagrams = first_anagrams(word1)
  anagrams.include?(word2)
end

puts anagram?("gizmo", "sally") == false
puts anagram?("elvis", "lives") == true

# O(n^2)
def second_anagram?(word1, word2)
  word1_c, word2_c = word1.chars, word2.chars
  word1_c.each do |c1|
    word2_c.each_index do |i|
      if word2_c[i] == c1
        word2_c.delete_at(i)
        break
      end
    end
  end
  word2_c.empty?
end


puts second_anagram?("gizmo", "sally") == false
puts second_anagram?("elvis", "lives") == true

#O(nlogn) avg. worst case with quicksort = O(n^2)
def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

puts third_anagram?("gizmo", "sally") == false
puts third_anagram?("elvis", "lives") == true

#O(3n) = O(n)


def fourth_anagram?(word1, word2)
  h = Hash.new(0)
  word1.chars.each {|char| h[char] += 1 }
  word2.chars.each {|char| h[char] -= 1}
  h.values.all? { |value| value.zero? }
end


puts fourth_anagram?("gizmo", "sally") == false
puts fourth_anagram?("elvis", "lives") == true
