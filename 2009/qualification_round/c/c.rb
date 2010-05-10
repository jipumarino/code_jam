$searching = "xyz"

def root()
  []
end

def reject(c)
  c.map{|x| $line[x].to_s}.join != $searching[0,c.size]
end

def accept(c)
  c.map{|x| $line[x]}.join == $searching
end

def first(c)
  c + [0]
end

def next_(s)
  s [-1] = s[-1]+1
  return s
end

def output
  puts "EA"
end

def bt(c)
  return if reject(c) 
  output(c) if accept(c)
  s = first(c)
  while s!=[] do
    bt(s)
    s = next_(s)
  end
end
    

STDIN.read[2..-1].each_with_index do |line, index|
  $line = line.chomp
  bt(root())
end