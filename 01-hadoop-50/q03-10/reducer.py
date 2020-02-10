import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
from operator import itemgetter
if __name__ == '__main__':
    lista = [] 
    for line in sys.stdin:
        if len(line.strip())>0:
            #print(line)
            key,val = line.split()
            lista.append([key,int(val.strip())]) 
    l_sorted = sorted(lista, key=itemgetter(1))
    #print(l_sorted)  
    for tup in l_sorted:
        sys.stdout.write("{},{}\n".format(tup[0], tup[1]))