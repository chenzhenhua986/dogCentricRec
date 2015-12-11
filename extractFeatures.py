import caffe
import sys
from scipy import signal
import numpy as np

# Call caffe to extract features from one video
net = caffe.Net('/u/chen478/dogCentric/deploy.prototxt','/u/chen478/dogCentric/bvlc_reference_caffenet.caffemodel', caffe.TEST)
net.forward()
features = net.blobs['fc7'].data
features = features.T
n = features.shape[0]
print features.shape

# Apply wavelet transfom on features extract from the same video and concatenae them to form the final feature which represents the video
feature = []
widths = np.arange(1, 4)
for i in range(n):
    cwtmatr = signal.cwt(features[i], signal.ricker, widths)
    feature = feature + list(cwtmatr.reshape(1, cwtmatr.shape[0]*cwtmatr.shape[1]))

f = open("/nobackup/chen478/features/" + sys.argv[1], "r+")
s = ''
for i in range(n):
    for j in feature[i]:
	s += str(j) + ' '	

f.write(s)

