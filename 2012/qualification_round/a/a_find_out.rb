orig = "our language is impossible to understand there are twenty six factorial possibilities so it is okay if you want to just give up"
trans = "ejp mysljylc kd kxveddknmc re jsicpdrysi rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd de kr kd eoya kw aej tysr re ujdr lkgc jv"

pairs = orig.each_char.zip(trans.each_char)
pairs += [['a', 'y'], ['o', 'e'], ['z', 'q']]

# pairs.map{|x| x[0]}.uniq.sort # missing q
# pairs.map{|x| x[1]}.uniq.sort # missing z

pairs += [['q', 'z']]

translator = Hash[pairs.map(&:reverse).sort]

