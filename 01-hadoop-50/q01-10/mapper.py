#!/usr/bin/python
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		val = line.split(',')[2]
		sys.stdout.write("{}\t1\n".format(val))