t_max, p_max = 0, 0
p_limit = 1000

2.step(p_limit, 2) do |p|
  t = 0
  (2 .. p/4).each do |a|
    if (p * (p - 2 * a) % (2 * (p - a))).zero?
      t += 1
    end
  end

  if t > t_max
    t_max, p_max = t, p
  end
end

puts p_max
