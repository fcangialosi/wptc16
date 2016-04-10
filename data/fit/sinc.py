from scipy.io import loadmat
import os,sys
from math import sin

data = loadmat("5Ghz.mat")

a = float(data['x1'][0][0])
b = float(data['x1'][0][1])
c = float(data['x1'][0][2])
d = float(data['x1'][0][3])

def sinc(x):
	return sin(x)/x
def f(x):
	return ((a * sinc((x + c) / b)) + d)

#a,b,c,d

with open(sys.argv[1],'w') as fp:
	for i in range(len(data['reconstructionVpp'][0])):
		fp.write("{0} {1}\n".format(f((i/3)-45),data['e'][0][i]))
