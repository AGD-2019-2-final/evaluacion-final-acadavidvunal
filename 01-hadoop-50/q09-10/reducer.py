import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
if __name__ == '__main__':
	count = 0
	lista = [] 
	for line in sys.stdin:
		if len(line.strip())>0:
			key,dat,val = line.split()
			lista.append([key,dat,int(val.strip())])
			
	l_sorted = sorted(lista, key=itemgetter(2))
	for tup in l_sorted:
		if count <= 5:
			count+=1
			sys.stdout.write("{}\t{}\t{}\n".format(tup[0],tup[1], tup[2]))
		else:
			break