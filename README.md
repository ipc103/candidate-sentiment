# Candidate Sentiment

A Rails app to measure sentiment on Twitter relating to presidential candidates. Uses NLP from the Sentimentalizer Gem. Analyzing both the candidates recent tweets as well as tweets returned from the candidates names. 

The text of each tweet is analyzed and given a "probability", ranging from 0 (completely negative) to 1 (completely postiive). 

Data Points on each candidate consist of two rankings: 

1. An mean probability of their 20 most recent tweets at the time the data point was collected. 
2. Mean probability of the 75 most recent tweets mentioning that candidate

NOTE: Positive sentiment in tweets mentioning a candidate don't neccessarily reflect positive feelings, ie. "Saw a pinata of Donald Trump today :-) " would register positive. 


