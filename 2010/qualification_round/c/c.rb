# r: run times
# k: capacity
# n: number of groups

input = STDIN.read.split("\n")

(1..input[0].to_i).each do |i|
  r, k, n = input[i*2-1].split(" ").map{|x| x.to_i}
  g = input[i*2].split(" ").map{|x| x.to_i}
  orig_g = Array.new g
  rides = 0
  (1..r).each do |j|
    capacity = k
    cart = []
    while !g.empty? and g.first <= capacity do 
      cart.push g.shift
      capacity -= cart[-1]
      rides += cart[-1]
    end
    g += cart
    if g == orig_g
      rides = r/j*rides
      break
    end
  end
  
  puts "Case \##{i}: #{rides}"
  
end
