import os,sys
from scipy.io import loadmat

infile = filter(lambda x: '.mat' in x, os.listdir('.'))[0]
data = loadmat(infile)
time = data['timervariable'][0]#[44:]
vpp = data['reconstructionVpp'][0]#[44:]

#since_last = 0
for i in range(len(time)-1):
    print time[i],vpp[i]
    #since_last+=1
    if time[i+1]-time[i] > 3:
        #	print time[i]+0.01,0
        #	print time[i]+0.01,0
        #print since_last
        #since_last = 0
        print time[i+1]-0.01,'-'
        print time[i+1]-0.01,'-'
