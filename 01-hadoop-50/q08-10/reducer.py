import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    count = 0
    for line in sys.stdin:

        key, val,num = line.split("\t")
        val = float(val)
        num = int(num)

        if key == curkey:
        	total += val
        	count += num
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total,total/count))

            curkey = key
            total = val
            count = num


    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total,total/count))