require 'byebug'
require 'test/unit'
include Test::Unit::Assertions

# https://www.hackerrank.com/challenges/ctci-making-anagrams

def solution(str1, str2)
  hist_a = str1.split('').inject(Hash.new(0)){|h, k| h[k] +=1; h}
  hist_b = str2.split('').inject(Hash.new(0)){|h, k| h[k] +=1; h}
  deletions = 0

  hist_a.each do |key, a_val|
    b_val = hist_b.delete(key)
    deletions += b_val ? (a_val - b_val).abs : a_val
  end

  deletions += hist_b.inject(0){|mem, (key, b_val)| mem += b_val}
end

assert_equal 4, solution('cde', 'abc')
assert_equal 0, solution('bacdc', 'dcbac')
assert_equal 2, solution('bacdc', 'dcbad')
p "all tests passed"
