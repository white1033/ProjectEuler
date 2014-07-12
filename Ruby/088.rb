#!/usr/bin/env ruby
$nk = 0
$ok = []

def dfs(cnt, si, di, max)
  return true if si < 0
  if di == 1
    cnt += si
    if cnt <= 12000 && !$ok[cnt]
      $ok[cnt] = 1
      $nk += 1
    end
    return true
  end
  [max, di].min.downto(2) do |i|
    if di % i == 0
      dfs(cnt + 1, si - i, di / i, i)
    end
  end
end

n, ans = 1, 0
while $nk < 12000
  big, last = n, $nk
  2.upto(big - 1) do |i|
    big /= i while big % i == 0
    big = i if big == 1
  end
  big.upto(n) do |i|
    dfs(1, n - i, n / i, i) if n % i == 0
  end
  ans += n if last != $nk
  n += 1
end
puts ans - 1
