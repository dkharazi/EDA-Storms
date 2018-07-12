## Overview

Severe weather events can cause both economic and public health issues to those communities directly involved in the storm, and those that rely on their resources, as well. In recent years, there has been an increasing amount of storms that have destroyed cities and taken hundreds of lives. These storms will continue to grow in frequency and magnitude due to changes in the climate. Therefore, we should make a greater effort to better understand storms in order to minimize the amount of destruction caused by them through preparation.

This analysis will explore the U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database. This database tracks characteristics of major storms and weather events in the United States, including when and where they occur, as well as estimates of any fatalities, injuries, and property damage. Given the data, we want to understand more about the following:

  1. Across the United States, which types of events (as indicated in the Event variable) are most harmful with respect to population health?
  2. Across the United States, which types of events have the greatest economic consequences?

There is also some documentation of the database available. After analyzing each type of storm, we will find how some of the variables are constructed/defined, and we will be able to prove that tornados are the most harmful in reference to public health, and floods are the most harmful in reference to the economy. For additional information, refer to the National Weather Service's [documentation](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf) and some of the [FAQ](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf) that the National Climatic Data Center receives.

Dataset: [Storm Data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2) [47 MB]

## Key Variable Descriptions

- `State:` The state in which a natural disaster occurred.
- `Begin Date:` The date at which a natural disaster started.
- `Begin Time:` The time at which a natural disaster started.
- `Begin Location:` The location at which a natural disaster started.
- `Latitude:` The latitude at which a natural disaster started.
- `Longitude:` The longitude at which a natural disaster started.
- `Time Zone:` The time zone in which a natural disaster ocurred.
- `County:` The county at which a natural disaster initially affected.
- `State:` The state at which a natural disaster occurred.
- `Type:` The type of natural disaster that occurred.
- `End Date:` The date at which a natural disaster ended.
- `End Time:` The time at which a natural disaster ended.
- `End Location:` The location at which a natural disaster ended.
- `Fatalities:` The number of deaths caused by a natural disaster.
- `Injuries:` The number of injuries caused by a natural disaster.
- `Latitude:` The latitude at which a natural disaster started.
- `End Latitude:` The latitude at which a natural disaster ended.
- `End Longitude:` The longitude at which a natural disaster ended.
- `Remarks:` Any comments made about a natural disaster.
- `Refnum:` The reference number of a natural disaster.
