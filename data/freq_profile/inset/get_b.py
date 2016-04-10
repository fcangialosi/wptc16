from scipy.io import loadmat
import sys,os

mats = filter(lambda x : '.mat' in x, os.listdir('./'))
for mat in mats:
	data = loadmat(mat)
	f = int(mat.lower().split("ghz")[0])
	b = float(data['x1'][0][1])
	print f,b
