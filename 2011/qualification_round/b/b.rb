input = STDIN.read.split("\n")
casos = input[0].to_i

(0...casos).each do |caso|
  
  #parsing
  line = input[caso+1].split(' ')
  cant_combines = line[0].to_i
  combine = line[1..cant_combines][0]
  combine = combine.split('') if combine
  cant_opposed = line[cant_combines+1].to_i
  opposed = line[(cant_combines+2)..(cant_combines+cant_opposed+1)][0]
  opposed = opposed.split('') if opposed
  invoked = line[cant_combines+cant_opposed+3].split('')

  #invocation
  result = []
  invoked.each do |i|
    result << i
    if result.size > 1
      if combine and (combine[0..1] == result[-2..-1] or combine[0..1] == result[-2..-1].reverse)
        result.delete_at(-1)
        result[-1] = combine[2]
      elsif opposed and ((i == opposed[0] and result[0..-2].any?{|el| el==opposed[1]}) or (i == opposed[1] and result[0..-2].any?{|el| el==opposed[0]}))
        result = []
      end
    end
  end
  puts "Case \##{caso+1}: [#{result.join(', ')}]"

end




