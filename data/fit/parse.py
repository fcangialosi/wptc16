from scipy.io import loadmat
import os,sys

ghz = '5'
data = loadmat(ghz+"ghz.mat")

print data['x1'] #a,b,c,d

with open(ghz+"ghz.out",'w') as f:
	for i in range(len(data['reconstructionVpp'][0])):
		f.write("{0} {1}\n".format(data['reconstructionVpp'][0][i],data['e'][0][i]))
