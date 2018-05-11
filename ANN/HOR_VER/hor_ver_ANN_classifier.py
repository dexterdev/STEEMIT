# USAGE
# python hor_ver_ANN_classifier.py /path/to/image_file
from keras.models import load_model
import cv2
import numpy as np
import sys

def image_to_feature_vector(image, size=(32, 32)):
	# resize the image to a fixed size, then flatten the image into
	# a list of raw pixel intensities
	return cv2.resize(cv2.cvtColor(image, cv2.COLOR_BGR2GRAY), size).flatten()

#loads a pre-trained model for cat-dog classification
model = load_model('hor_ver_32_32.h5')

image_test = cv2.imread(sys.argv[1])
image_test = image_to_feature_vector(image_test)
pr = model.predict_classes(np.array([image_test]))

if pr==[1]:
    print "Vertical line"
else:
    print "Horizontal line"
