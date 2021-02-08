#!/usr/bin/env python
# coding: utf-8

# In[56]:


import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import json as js
import requests as rq
import os
#import numpy as np # linear algebra
#import seaborn as sns # For creating plots
#import matplotlib.ticker as mtick # For specifying the axes tick format 
#import matplotlib.pyplot as plt


# In[57]:


df=pd.read_json('https://api.exchangeratesapi.io/latest?base=USD')


# In[49]:


#df.to_csv('latest_currency_rates.CSV')


# In[31]:


#df.to_csv('D:\latest_currency_rates.csv', index=False)


# In[58]:


##
def main():
    filePath = 'D:\latest_currency_rates.csv';
    # Remove a file
    #os.remove('D:\latest_currency_rates.csv')
    FileNotFoundError
    # As file at filePath is deleted now, so we should check if file exists or not not before deleting them
    if os.path.exists(filePath):
        os.remove(filePath)
    else:
        print("File not found!")
    # Handle errors while calling os.remove()
    try:
        os.remove(filePath)
    except:
        print("Error handlingwhile deleting file ", filePath)
    # Handle errors while calling os.ulink()
    try:
        os.ulink(filePath)
    except:
        print("Error while deleting file ", filePath)
if __name__ == '__main__':
    main()


# In[59]:


df.to_csv('D:\latest_currency_rates.csv', index= True)


# In[ ]:




