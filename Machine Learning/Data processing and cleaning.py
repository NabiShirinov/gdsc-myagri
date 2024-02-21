import pandas as pd
import numpy as np
rainfall= pd.read_csv(r'C:\xampp\htdocs\rainforest\Machine Learning\Hoppers Crossing-Hourly-Rainfall.csv')
river_level= pd.read_csv(r'C:\xampp\htdocs\rainforest\Machine Learning\Hoppers Crossing-Hourly-River-Level.csv')
relation = pd.merge(rainfall,river_level,on='Date/Time')
print(relation["Level (m)"].mean())
relation = relation.iloc[::-1]
relation.index = relation.index[::-1]
print(relation.head())
relation['date'] = pd.to_datetime(relation['Date/Time'])
print(relation.resample('1M', on = 'date').mean())
monthly_avg_rainfall = dict()
monthly_avg_cumulative_rainfall = dict()
monthly_avg_Level = dict()

for month in range(1,12+1):
    count = 0
    value_rainfall = 0
    value_level = 0
    value_cumulative = 0
    
    
    if month == 12:
        month = 0
        
    for i in range(relation.resample('1M', on = 'date').mean().shape[0]):   
        
        if i%12 == month:
            
            count +=1 
            value_rainfall += relation.resample('1M', on = 'date').mean().iloc[i][0]
            value_cumulative += relation.resample('1M', on = 'date').mean().iloc[i][1]
            value_level += relation.resample('1M', on = 'date').mean().iloc[i][2]
        
    
    value_rainfall  = value_rainfall/count
    value_cumulative = value_cumulative/count
    value_level = value_level/count
    
    if month == 0:
        month = 12
    
    monthly_avg_rainfall[month] = value_rainfall
    monthly_avg_cumulative_rainfall[month] = value_cumulative
    monthly_avg_Level[month] = value_level
    print('this is count ',count,'Month num ',month)   
            
            
relation.resample('1D', on = 'date').mean().shape
input_all_batches = list()
output_all_batches = list()

max_height = 1.5

for i in range(relation.resample('1D', on = 'date').mean().shape[0] - 21 ): 
    one_input = list()
    output = list()
    print(relation.resample('1D', on = 'date').mean().iloc[i])
    level = relation.resample('1D', on = 'date').mean().iloc[1][2]
    month = relation.resample('1D', on = 'date').mean().index[i].month
    
    month_avg = monthly_avg_Level[month]
    
    cumulative_rain_fall_1 = relation.resample('1D', on = 'date').mean().iloc[i:i+7,1].mean()
    cumulative_rain_fall_2 = relation.resample('1D', on = 'date').mean().iloc[i+7:i+14,1].mean()
    
    one_input.append(level)
    one_input.append(month_avg)
    one_input.append(cumulative_rain_fall_1)
    one_input.append(cumulative_rain_fall_2)
    
    max_level = relation.resample('1D', on = 'date').mean().iloc[i+14:i+21,2].max()
    output_all_batches.append(max_level)
    
    input_all_batches.append(one_input)
print(input_all_batches)
output_all_batches = np.array(output_all_batches)
input_all_batches = np.array(input_all_batches)
print(input_all_batches.shape)
output_all_batches = output_all_batches.reshape(3267,1)
input_all_batches = input_all_batches.reshape(3267,4)
print(input_all_batches.shape,output_all_batches.shape)
input_all_batches = input_all_batches.T
output_all_batches = output_all_batches.T
input_all_batches.shape,output_all_batches.shape
np.savetxt('input.csv',input_all_batches,delimiter=',')
np.savetxt('output.csv',output_all_batches,delimiter=',')