# r: run times
# k: capacity
# n: number of groups

input = STDIN.read.split("\n")

(1..input[0].to_i).each do |i|
  r, k, n = input[i*2-1].split(" ").map{|x| x.to_i}
  g = input[i*2].split(" ").map{|x| x.to_i}
  rides = 0
  r.times do 
    capacity = k
    cart = []
    while capacity >= 0 and !g.empty? do 
      cart.push g.shift
      capacity -= cart[-1]
      rides += cart[-1]
    end
    if capacity < 0
      rides -= cart[-1]
      g.unshift cart[-1] 
      g += cart[0..-2]
    else
      g += cart
    end
    p rides
  end
  
  p rides
  
end
