from scipy.io import loadmat
import os,sys
from tqdm import *

data = loadmat("Overlap_1.mat")

if sys.argv[1] == "sona":
	sonaX = [x*1000000 for x in data['sonaT'][0]]
	sonaY = [y*1000 for y in data['sonaV']]
	for i in tqdm(range(len(sonaX)),file=sys.stderr):
		print sonaX[i],sonaY[i][0]
elif sys.argv[1] == "recon":
	reconX = [x*1000000 for x in data['overReconT'][0]]
	reconY = [y*1000 for y in data['overReconV']]
	for i in tqdm(range(len(reconX)),file=sys.stderr):
		print reconX[i],reconY[i][0]
else:
	print "Invalid argument."
