INF = 20000

$solution = []
$symbol = "a"
$map = []

def remaining_time_in_dir(t, w, n, s)
  rem = (s - t) % (n + w)  
  if rem < n
    return [:n, n - rem]
  else
    return [:w, n + w -rem]
  end
end

def cross_intersection(t, w, n, s)
  rtd = remaining_time_in_dir(t, w, n, s)
  return rtd[1] + 1

end
  
  
end

def square_sum(num, base)
  num.to_s(base).split("").map{|x| x.to_i*x.to_i}.inject(0){|x,y| x+y}
end

def is_happy(num, base)
  while num != 1
    puts "#{num} #{base}"
  end

end

def min_base(bases)
  (1..100).each do |test_int| 
    p bases.map{|base| is_happy(test_int, base)}
  end
end

input = STDIN.read.split("\n")

input[1..-1].each_with_index do |bases_text, problem|
  
  bases = bases_text.split(" ").map{|x| x.to_i}
  
  puts "Case \##{problem}: #{min_base bases}"
  
end
