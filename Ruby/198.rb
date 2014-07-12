def p198(m1=100_000_000, z=100, cnt=0)
  m2 = m1 / 2
  a = m = Math.sqrt(m2).to_i
  stack = [*z ... m]
  while not stack.empty?
    b = stack[-1]
    if a * b > m2
      a = stack.pop
    else
      cnt += 1
      stack << a + b
    end
  end
  return cnt + m2 - z / 2
end

puts p198
