def is_on?(n,k)
  ("%0#{n}d"%(k.to_s 2)).reverse[0,n] =~ /^1*$/ ? "ON" : "OFF"
end

input = STDIN.read.split("\n")

(1..input[0].to_i).each do |i|
  n, k = input[i].split(" ")
  puts "Case \##{i}: "+is_on?(n.to_i,k.to_i)
end
