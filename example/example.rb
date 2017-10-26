## This is the template used to generate new files

require 'byebug'
require 'test/unit'
include Test::Unit::Assertions

max_chain_size   = 0
max_number       = 0

[*1..1_000_000].each do |el|
  current_el = el
  chain_elements_size = 1

  loop do
    current_el = current_el.odd? ? (3 * current_el +1) : current_el/2
    chain_elements_size += 1
    break if current_el == 1
  end unless el == 1

  if max_chain_size < chain_elements_size
    max_chain_size = chain_elements_size
    max_number = el
  end
end

assert_equal 837799, max_number
assert_equal 525, max_chain_size
p "all tests passed"
