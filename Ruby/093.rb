#!/usr/bin/env ruby
$ops = [ ['+', ->(x, y) { [x[0] * y[1] + x[1] * y[0], x[1] * y[1]] }],
         ['-', ->(x, y) { [x[0] * y[1] - x[1] * y[0], x[1] * y[1]] }],
         ['*', ->(x, y) { [x[0] * y[0], x[1] * y[1]] }],
         ['/', ->(x, y) { [x[0] * y[1], x[1] * y[0]] }]
]

def dump(path)
  if path[-1].is_a?(String)
    p = path[0 ... -1]
    print '('
    p = dump(p)
    print path[-1]
    p = dump(p)
    print ')'
    return p
  else
    print path[-1]
    return path[0 ... -1]
  end
end

def solve(nums, path, stack, target)
  if nums.size.zero? && stack.size == 1 && target[0] * stack[0][1] == target[1] * stack[0][0] && !stack[0][1].zero?
    #dump(path)
    #puts
    $sol += 1
    return true
  end

  last = -1
  0.upto(nums.size - 1) do |i|
    next if nums[i] == last
    solve(nums[0 ... i] + nums[i+1 .. -1], path + [nums[i]], stack + [[nums[i], 1]], target)
    last = nums[i]
  end

  if stack.size >= 2
    $ops.each do |op|
      solve(nums, path + [op[0]], stack[0 ... -2] + [op[1].(stack[-1], stack[-2])], target)
    end
  end
end

max, nums = 0, []
[*3 .. 9].combination(2) do |com|
  target = [1, 1]
  while true
    $sol = 0
    solve([1, 2].concat(com), [], [], target)
    if $sol.zero?
      max, nums = target[0], com if target[0] > max
      break
    else
      target[0] += 1
    end
  end
end
