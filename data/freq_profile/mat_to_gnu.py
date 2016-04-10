import os,sys
from scipy.io import loadmat

data = {}
for filename in os.listdir('./data/'):
	if '.mat' in filename:
		data[filename.split("Ghz")[0]] = loadmat('./data/'+filename)['reconstructionVpp']

# sanity check
#for k,v in data.iteritems():
#	print k,len(v[0])
#sys.exit(1)

for t in range(len(data[data.keys()[0]][0])):
	for i in [str(x) for x in range(4,9+1)]:
		print data[i][0][t],
	print
