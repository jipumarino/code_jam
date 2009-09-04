INF = 20000

$solution = []
$symbol = "a"
$map = []

def print_solution(problem_number, height, width)
  puts "Case \##{problem_number}:"
  (1..height).each {|i| (1..width).each {|j|  print "#{$solution[i][j]} "}; puts ""}
end

def pathfind(i,j)

  # If already marked
  if $solution[i][j].class == String
    return $solution[i][j]
  end
  
  neighbours = [[i-1,j],[i,j-1],[i,j+1],[i+1,j]]            
  diffs = neighbours.map{|c| $map[i][j] > $map[c[0]][c[1]] ? $map[i][j]-$map[c[0]][c[1]] : 0}
  
  if diffs.max == 0
    # If basin, mark it
    $solution[i][j] = $symbol
    $symbol = $symbol.next
    return $solution[i][j]
  else
    # Recursive
    find_in = neighbours[diffs.index(diffs.max)]
    $solution[i][j] = pathfind(find_in[0], find_in[1]) 
  end
  
end

input = STDIN.read.split("\n")

problems = input[0].to_i
height = 1
width = 0
line = 1

(1..problems).each do |current_problem|
  height, width = input[line].split(" ").map{|x| x.to_i}
  line += 1
  $map = []

  # Create map surrounding it with mountains
  $map << [INF]*(width+2)
  (0...height).each do |row|
    $map << [INF]+input[row+line].split(" ").map{|x| x.to_i}+[INF]
  end
  $map << [INF]*(width+2)
  
  $solution = Array.new(height+2).map{|r| r = Array.new(width+2)}
  $symbol="a"
  (1..height).each {|i| (1..width).each {|j| $solution[i][j] = pathfind(i,j)}}  
  print_solution(current_problem,height, width)
  
  line += height
end


