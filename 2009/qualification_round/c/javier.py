from sys import stdin

N = int(stdin.readline())
original = "welcome to code jam"
for i in range(0, N):
    texto = stdin.readline().replace("\n","")
    matriz = [ [ 0 for j in range(0, len(texto)) ] for k in range(0,len(original)) ]
    for j in range(0, len(original)):
        for k in range(j, len(texto)):
            if original[j] == texto[k]:
                if j == 0 and k == 0:
                    matriz[0][0] = 1
                elif j == 0:
                    matriz[j][k] = 1 + matriz[j][k-1]
                else:
                    matriz[j][k] = matriz[j-1][k-1] + matriz[j][k-1]
            else:
                if k > 0:
                    matriz[j][k] = matriz[j][k-1]
    total = matriz[len(original)-1][len(texto)-1] % 10000
    print "Case #%d: %04d" % ((i+1), total)
