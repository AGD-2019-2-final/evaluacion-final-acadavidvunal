import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    min_v = 999999999999999999
    max_v = 0
    for line in sys.stdin:

        key, min_val = line.split("\t")
        val = float(min_val)

        if key == curkey:
        	if min_v < val:
        		min_v = val
        	if max_v > val:
        		max_v = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, min_v,max_v))

            curkey = key
            min_v = val
            max_v = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, min_v,max_v))