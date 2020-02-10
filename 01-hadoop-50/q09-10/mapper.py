import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		arr = line.split()
		key = arr[0]
		dat = arr[1]
		val = arr[2]
		sys.stdout.write("{}\t{}\t{}\n".format(key,dat,val))