input = STDIN.read.split("\n")

l, d, n = input.first.split(" ").map{|x| x.to_i}

dict = input[1..d]
patterns = input[d+1..d+n].map{|x| Regexp.new(x.gsub("(","[").gsub(")","]").chomp)}

patterns.each_with_index do |pat,i|
  puts "Case \##{i+1}: "+dict.select{|w| w =~ pat}.size.to_s
end
