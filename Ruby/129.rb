def A(n)
  return 0 if n.gcd(10) != 1
  x, k = 1, 1
  while x != 0
    x = (x * 10 + 1) % n
    k += 1
  end
  return k
end

target = 1_000_001
n = target
n += 2 while A(n) < target
puts n
