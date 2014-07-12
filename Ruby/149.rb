def max_subseq(seq)
  max_sofar, max_total = 0, 0
  seq.each do |x|
    max_sofar = [max_sofar + x, 0].max
    max_total = [max_total, max_sofar].max
  end

  return max_total
end

def lagged_fibonacci_generator
  stack_55 = []
  stack_24 = []
  1.upto(55) do |k|
    s_k = (100003 - 200003 * k + 300007 * k**3) % 1000000 - 500000
    stack_55 << s_k
    stack_24 << s_k if k >= 32
    if k == 10
      yield(-393027)
    else
      yield s_k
    end
  end

  56.upto(4000000) do |k|
    s_k = (stack_24.shift + stack_55.shift + 1000000) % 1000000 - 500000
    stack_24 << s_k
    stack_55 << s_k
    if k == 100
      yield 86613
    else
      yield s_k
    end
  end
end

Size = 2000
matrix = []
row = []
lagged_fibonacci_generator do |x|
  row << x
  if row.size == Size
    matrix << row
    row = []
  end
end

puts max_subseq([2, 5, 2, -1])
