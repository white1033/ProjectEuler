def mul_arr(arr1, arr2)
  new_arr = [0] * (arr1.size + arr2.size - 1)
  arr1.each_with_index do |e1, i1|
    arr2.each_with_index do |e2, i2|
      new_arr[i1 + i2] += e1 * e2
    end
  end
  return new_arr
end

target = 15
result = Array.new(target) { |i| [i+1, 1] }.reduce { |a, b| mul_arr(a, b) }
puts result.reduce(:+) / result.last((target + 1) / 2).reduce(:+)
