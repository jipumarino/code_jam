debug = false
input = STDIN.read.split("\n")
casos = input[0].to_i

(0...casos).each do |caso|

  sequence = input[caso+1].split(' ')[1..-1].each_slice(2).map{|x,y| [x,y.to_i]}
  groups = Hash[sequence.group_by(&:first).map{|k,v| [k,v.map{|e| e[1]}]}]
  groups['O'] ||= []
  groups['B'] ||= []
  
  p sequence if debug
  p groups if debug

  #simulation
  o = 1
  b = 1
  time = 0
  until sequence.empty? do
    o_pressed=false
    b_pressed=false
    if sequence.first == ['O', o]
      sequence.shift
      groups['O'].shift
      o_pressed=true
      puts "O pressed #{o}" if debug
    end
    if sequence.first == ['B', b] and !o_pressed
      sequence.shift
      groups['B'].shift
      b_pressed=true
      puts "B pressed #{b}" if debug
    end
    if sequence.first == ['O', o] and !b_pressed and !o_pressed
      sequence.shift
      groups['O'].shift
      o_pressed=true
      puts "O pressed #{b}" if debug
    end

    if next_o = groups['O'][0] and !o_pressed
      if next_o > o
        o += 1
        puts "O fwd #{o}" if debug
      elsif next_o < o 
        o -= 1
        puts "O bck #{o}" if debug
      end
    end
    
    if next_b = groups['B'][0] and !b_pressed
      if next_b > b
        b += 1
        puts "B fwd #{b}" if debug
      elsif next_b < b 
        b -= 1
        puts "B bck #{b}" if debug
      end
    end
    # puts "o:#{o} b:#{b}"

    time += 1
  end
  puts "Case \##{caso+1}: #{time}"

end



