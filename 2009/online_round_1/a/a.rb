
$memo_happy = {}
$memo_base = {}

def square_sum(num, base)
  num.to_s(base).split("").map{|x| x.to_i*x.to_i}.inject(0){|x,y| x+y}
end

def is_happy(num, base)
  if $memo_happy[[num,base]]
    return $memo_happy[[num,base]]
  end
  (1..10).each do 
    num = square_sum(num, base)
    if num == 1
      return $memo_happy[[num,base]] = true
    end
  end
  return $memo_happy[[num,base]] = false
end

def min_base(bases)
  next_int = false
  if $memo_base[bases.sort]
    return $memo_base[bases.sort]
  end
  (2..10000000).each do |test_int| 
    bases.each do |base|
      next_int = true unless is_happy(test_int, base)        
    end
    if next_int
      next_int = false
      next
    end
    return $memo_base[bases.sort] = test_int
  end
end

input = STDIN.read.split("\n")

input[1..-1].each_with_index do |bases_text, problem|
  
  bases = bases_text.split(" ").map{|x| x.to_i}
  
  puts "Case \##{problem+1}: #{min_base bases}"
  
end

