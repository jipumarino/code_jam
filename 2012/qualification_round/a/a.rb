# orig = "our language is impossible to understand there are twenty six factorial possibilities so it is okay if you want to just give up"
# trans = "ejp mysljylc kd kxveddknmc re jsicpdrysi rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd de kr kd eoya kw aej tysr re ujdr lkgc jv"

# pairs = orig.each_char.zip(trans.each_char)
# pairs += [['a', 'y'], ['o', 'e'], ['z', 'q']]

# # pairs.map{|x| x[0]}.uniq.sort # missing q
# # pairs.map{|x| x[1]}.uniq.sort # missing z

# pairs += [['q', 'z']]

# untranslator = Hash[pairs.map(&:reverse).sort]


untranslator = {" "=>" ", "a"=>"y", "b"=>"h", "c"=>"e", "d"=>"s", "e"=>"o", "f"=>"c", "g"=>"v", "h"=>"x", "i"=>"d", "j"=>"u", "k"=>"i", "l"=>"g", "m"=>"l", "n"=>"b", "o"=>"k", "p"=>"r", "q"=>"z", "r"=>"t", "s"=>"n", "t"=>"w", "u"=>"j", "v"=>"p", "w"=>"f", "x"=>"m", "y"=>"a", "z"=>"q"}

input = STDIN.read.split("\n")
casos = input[0].to_i

(1..casos).each do |caso|
  translated = input[caso]
  original = translated.each_char.map{|c| untranslator[c]}.join
  puts "Case \##{caso}: #{original}"
end
