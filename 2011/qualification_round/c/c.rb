input = STDIN.read.split("\n")
casos = input[0].to_i

(0...casos).each do |caso|
  arr = input[caso*2+2].split(' ').map{|j| j.to_i}
  arr_size = arr.size
  can = false
  max = 0
  (1...(2**(arr_size)-1)).each do |i|
    pilas = ("%0#{arr_size}d"%i.to_s(2)).split('').zip(arr).group_by{|j| j[0]}
    sean_fake_sum    = pilas['0'].nil? ? 0 : pilas['0'].map{|j| j[1]}.inject(0){|a,b| a^b}
    sean_real_sum    = pilas['0'].nil? ? 0 : pilas['0'].map{|j| j[1]}.inject(0){|a,b| a+b}
    patrick_fake_sum = pilas['1'].nil? ? 0 : pilas['1'].map{|j| j[1]}.inject(0){|a,b| a^b}
    if sean_fake_sum == patrick_fake_sum
      can = true
      max = sean_real_sum if sean_real_sum > max
    end
  end

  puts "Case \##{caso+1}: #{(can ? max : 'NO')}"
end



