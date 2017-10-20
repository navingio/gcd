---
title: "README.md"
author: "G. Scotti"
date: "10/20/2017"
---

# Peer-graded Assignment: Getting and Cleaning Data Course Project

## The dataset includes the following files:

- 'README.md': this file

- 'run_analysis.R': R script to prapare a tidy data set based on raw data included in the zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- 'tidy_data.txt': tidy data set. ASCII file, result of executing run_analysis.R on the raw data specified above

- 'CodeBook.md' : Codebook file describing variables included in tidy_data as well as the tranformations applied to the raw data for creating the tidy data set


tidy_data.txt can be generated from raw data using the following command. 

``` 
source ("[path]/run_analysis.R")

```

[path] is the file path to run_analysis.R

The script must be executed in the working directory where the Dataset.zip has been uncompressed


tidy_data.txt can be loaded as data.frame by using the command:

```
data <- read.table("tidy_data.txt", header = TRUE)

```

## Tidy Data Set
tidy_data.txt is a cleaned up version of the raw data provided in Dataset.zip. It is 'tidy' in the sense that
various sparse information on wearable computing measurement are collected and pre-processed, by computing means of measures on all combinations of subject and activity.


