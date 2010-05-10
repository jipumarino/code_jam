def permutations li
  if li.length < 2
    yield li
  else
    li.each do |element| 
      permutations(li.select() {|n| n != element}) do |val|
         yield([element] << val)
       end
    end
  end
end

permutations((0..3).to_a) do |n| 
  puts
  print n
end

def next_(arr,limit)
return [0]   if arr.empty 
if arr.last<limit
  return arr[0..-2]+[arr.last+1]
else
  return next_(arr[0..-2],limit)+[0]
end
end
  
