$cache = {}
def solve(s, d, n)
    if $cache[[s,d,n]]
        $cache[[s,d,n]]
    elsif s.size > n
        $cache[[s,d,n]] = 0
    elsif n == 0
        $cache[[s,d,n]] = 1
    elsif d == 9
        $cache[[s,d,n]] = solve(s-[8],8,n-1)
    elsif d == 0
        $cache[[s,d,n]] = solve(s-[1],1,n-1)
    else
        $cache[[s,d,n]] = solve(s-[d-1],d-1,n-1) + solve(s-[d+1],d+1,n-1)
    end
end
cnt = 0
9.upto(39) do |n|
    1.upto(9) do |d|
        cnt += solve([*0..9]-[d], d, n)
    end
end
p cnt
