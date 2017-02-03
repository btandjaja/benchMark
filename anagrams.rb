require 'byebug'

def first_anagram?(first_word, second_word)
 permutations(first_word).include?(second_word)
end

def permutations(word)
  # debugger
  return [word] if word.length == 1
  combinations = permutations(word[1..-1])
  result = []
  combinations.each do |combination|
    (0..combination.length).each do |index|
      result << combination[0...index] + word[0] + combination[index..-1]
    end
  end
  result
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(first_word,second_word)
  return false unless first_word.length == second_word.length
  first_word.each_char do |letter|
    if second_word.include?(letter)
      index = second_word.index(letter)
      second_word[index] = ""
    end
  end
  second_word.empty?
end

def third_anagram?(first_word,second_word)
  first_word.sort == second_word.sort
end

def fourth_anagram?(first_word,second_word)
  first_hash = Hash.new(0)
  # first_word.each_char { |el| hash.key?(el) ? hash[el] += 1 : hash[el] = 1 }
  first_word.each_char { |el| first_hash[el] += 1}
  second_hash = Hash.new(0)
  # first_word.each_char { |el| hash.key?(el) ? hash[el] += 1 : hash[el] = 1 }
  second_word.each_char { |el| second_hash[el] += 1}
  first_hash.each do |k,v|
    return false unless v == second_hash[k]
  end
  true
end
######main######
FIRST_WORD = %w(Ancestries Laying Married Dreads Lactoprotein Carthorse Reactive Discounted)

# start_time = Time.now
# p first_anagram?("ancestries", "resistance")    #=> false
# p first_anagram?("lactoprotein", "protectional")    #=> true
# end_time = Time.now
# total_time = end_time - start_time
# p total_time
#
# start_time = Time.now
# p second_anagram?("ancestries", "resistance")    #=> false
# p second_anagram?("lactoprotein", "protectional")    #=> true
# end_time = Time.now
# total_time = end_time - start_time
# p total_time
start_time = Time.now
p fourth_anagram?("ancestries", "resistance")    #=> false
p fourth_anagram?("lactoprotein", "protectional")    #=> true
