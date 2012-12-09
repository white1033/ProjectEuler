#!/usr/bin/env ruby -wKU
func = {
  3 => ->(x) {x * (x + 1) / 2},
  4 => ->(x) {x * x},
  5 => ->(x) {x * (3 * x - 1) / 2},
  6 => ->(x) {x * (2 * x - 1)},
  7 => ->(x) {x * (5 * x - 3) / 2},
  8 => ->(x) {x * (3 * x - 2)}
}

n, num, $type8 = 0, 0, []
$nums = Hash.new { |hash, key| hash[key] = [] }
while true
  n += 1
  (3 .. 8).reverse_each do |x|
    num = func[x].call(n)
    if (1000 ... 10000).include?(num)
      if x == 8
        $type8 << num
      else
        $nums[num / 100] << [num, x]
      end
    end
  end
  break if num > 9999
end

def solve(num_set, types)
  if types.size == 6
    if num_set[0] / 100 == num_set[-1] % 100
      puts num_set.reduce(:+)
    end
  else
    $nums[num_set[-1] % 100].each do |n|
      unless types.include?(n[1])
        solve(num_set + [n[0]], types + [n[1]])
      end
    end
  end
end
$type8.each { |e| solve([e], [8]) }
