#This file is a copy of Interface.ipynb
#Except, it is in the standard Python file type. Since its .PY
#While the original is a .ipynb Jupiter file type.
#This is so the R library reticlate can read the file.

#Also, this file ONLY contains the stuff R needs.

#Harrison Ressler
#Interface for model

import sys #Allows Python to communicate with command line
import joblib
import numpy as np

#Load model
saved_model = joblib.load("saved_model") #loads file

#Make functions to use it
def predict_pay(cab_type, source, surge_multiplier, product_id, name, minute, hour, day, month, year): #Named funct. predict_pay. Give it things that user will enter
    #List to put output data in
    output = []
    
    #What funct. does:
    for distance in [1,3,5]: #every iteration of the for loop, distance (i) would be the next one (Ex: 1,then 3, then 5) : This will give it a bunch of distances for it to get the average of (Since predicting distance is too tough right now)
        #For every distance (or i), do a predict()
        user_input = np.array([distance,cab_type,source,surge_multiplier,product_id,name,minute,hour,day,month,year])#List of all variables for predict given by user
        user_input = user_input.reshape(1, -1)
        output.append(saved_model.predict(user_input)[0]) #Append adds new data to list "output", & [0] grabs first item in list    
    return np.mean(output)

#sys.argv[] #Command line arguments
cmd_output = predict_pay(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5],sys.argv[6],sys.argv[7],sys.argv[7],sys.argv[8],sys.argv[9]) 
#[1] = first paramter in function. Ex: cab_type is 1st item in paramters, 2nd (2) is source, etc (See function for full in order list)
#cmd_output = output of command line

#Seeing what it is by printing it
print(cmd_output)

#How to get:

#Open Command prompt and enter (without #):
#cd desktop/Cab_Project
#python interface_for_R.py 10 10 3 1 5 5 13 59 5 12 2018

#The above listed numbers are parameters for predict_pay()