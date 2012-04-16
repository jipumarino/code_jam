input = STDIN.read.split("\n")
casos = input[0].to_i

$memoize_recycled_pair = {}
def recycled_pair?(pair)
  return $memoize_recycled_pair[pair] if $memoize_recycled_pair[pair]

  n = pair[0].to_s
  m = pair[1].to_s
  (1..$size-1).each do |s|
    if m == n[-s..-1]+n[0..-s-1]
      return $memoize_recycled_pair[pair] = true
    end
  end
  return $memoize_recycled_pair[pair] = false
end

(1..casos).each do |caso|
  a, b = input[caso].split(" ").map(&:to_i)

  $size = a.to_s.size

  total_reciclados = 0

  (a..b).each do |x|
    (x+1..b).each do |y|
      total_reciclados+=1 if recycled_pair?([x,y])
    end
  end

  puts "Case \##{caso}: #{total_reciclados}"
end

# p $memoize_recycled_pair