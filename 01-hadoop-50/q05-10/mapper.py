import sys
import datetime
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		arr = line.split()
		key = arr[1].split('-')[1]
		sys.stdout.write("{}\t1\n".format(key))