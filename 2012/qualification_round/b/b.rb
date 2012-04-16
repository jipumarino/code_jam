
def surprising_triplet?(triplet)
  triplet.max - triplet.min == 2
end

# def impossible_triplet?(triplet)
#   triplet.max - triplet.min > 2
# end

def best_result(triplet)
  triplet.max
end


# table = []
# (0..10).each do |a|
#   (a..10).each do |b|
#     (b..10).each do |c|
#       table << [a,b,c] unless impossible_triplet?([a,b,c])
#     end
#   end
# end

# combinaciones = table.group_by{|x,y,z| x+y+z}

combinaciones = {0=>[[0, 0, 0]], 1=>[[0, 0, 1]], 2=>[[0, 0, 2], [0, 1, 1]], 3=>[[0, 1, 2], [1, 1, 1]], 4=>[[0, 2, 2], [1, 1, 2]], 5=>[[1, 1, 3], [1, 2, 2]], 6=>[[1, 2, 3], [2, 2, 2]], 7=>[[1, 3, 3], [2, 2, 3]], 8=>[[2, 2, 4], [2, 3, 3]], 9=>[[2, 3, 4], [3, 3, 3]], 10=>[[2, 4, 4], [3, 3, 4]], 11=>[[3, 3, 5], [3, 4, 4]], 12=>[[3, 4, 5], [4, 4, 4]], 13=>[[3, 5, 5], [4, 4, 5]], 14=>[[4, 4, 6], [4, 5, 5]], 15=>[[4, 5, 6], [5, 5, 5]], 16=>[[4, 6, 6], [5, 5, 6]], 17=>[[5, 5, 7], [5, 6, 6]], 18=>[[5, 6, 7], [6, 6, 6]], 19=>[[5, 7, 7], [6, 6, 7]], 20=>[[6, 6, 8], [6, 7, 7]], 21=>[[6, 7, 8], [7, 7, 7]], 22=>[[6, 8, 8], [7, 7, 8]], 23=>[[7, 7, 9], [7, 8, 8]], 24=>[[7, 8, 9], [8, 8, 8]], 25=>[[7, 9, 9], [8, 8, 9]], 26=>[[8, 8, 10], [8, 9, 9]], 27=>[[8, 9, 10], [9, 9, 9]], 28=>[[8, 10, 10], [9, 9, 10]], 29=>[[9, 10, 10]], 30=>[[10, 10, 10]]} 

input = STDIN.read.split("\n")
casos = input[0].to_i


(1..casos).each do |caso|
  numeros = input[caso].split(" ").map(&:to_i)
  totals = numeros[3..-1]
  cant_surprising = numeros[1]
  min_points = numeros[2]

  posibles = []

  len = totals.size
  (0..(2**len-1)).each do |num|
    arr = ("%0#{len}d"%num.to_s(2)).split('').map(&:to_i)
    posibles << arr.each_with_index.map{|i,n| combinaciones[totals[n]][i]}
  end

  posibles.select!{|arr| arr.select{|x| x.nil?}.empty?}
  posibles.select!{|arr| arr.count{|arr| surprising_triplet?(arr)} == cant_surprising}
  max_with_min_points = posibles.map{|posible| posible.map{|triplet| best_result(triplet)}}.map{|posible| posible.count{|best| best >= min_points}}.max

  puts "Case \##{caso}: #{max_with_min_points}"

end


