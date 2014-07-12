SIZE = 50
ans = SIZE * SIZE * 3

1.upto(SIZE) do |i|
  1.upto(SIZE) do |j|
    tmp = i.gcd(j)
    di, dj = i / tmp, j / tmp
    ans += [j / di, (SIZE - i) / dj].min * 2
  end
end

puts ans
