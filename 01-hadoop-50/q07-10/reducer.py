import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
if __name__ == '__main__':
    lista = [] 
    for line in sys.stdin:
    	key,dat,val = line.split()
    	lista.append([key,dat,int(val.strip())]) 
    l_sorted = sorted(lista, key=itemgetter(0,2))
    #print(l_sorted)  
    for tup in l_sorted:
    	sys.stdout.write("{}   {}   {}\n".format(tup[0], tup[1], tup[2]))