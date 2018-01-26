#NuVasive Graphs

library(dplyr)
library(ggplot2)
library(scales)
#library(zoo)
library(gridExtra)
library(tidyr)

setwd("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData")
############################################################
#2005-06-06
ACAR20050606 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20050606.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20050606$DATE <- as.Date(as.character(ACAR20050606$DATE), format="%Y%m%d")
ACAR20050606$DATE <- as.character(ACAR20050606$DATE)

ACAR20050606G <- ggplot(ACAR20050606) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / RSB Spine: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2005-06-06", y="% Return")
  
  
BHAR20050606 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20050606.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20050606$DATE <- as.Date(as.character(BHAR20050606$DATE), format="%Y%m%d")
#BHAR20050606$DATE <- as.character(BHAR20050606$DATE)
BHAR20050606$BHAR <- (exp(cumsum(log(1+BHAR20050606$ARET)))) - (exp(cumsum(log(1+BHAR20050606$mret))))

BHAR20050606G <- ggplot(BHAR20050606) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / RSB Spine: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2005-06-06", y="% Return")

x11()
grid.arrange(ACAR20050606G, BHAR20050606G, ncol=2)
#########################################################################
#2005-08-12
ACAR20050812 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20050812.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20050812$DATE <- as.Date(as.character(ACAR20050812$DATE), format="%Y%m%d")
ACAR20050812$DATE <- as.character(ACAR20050812$DATE)

ACAR20050812G <- ggplot(ACAR20050812) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / RiverBend Designs: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2005-08-12", y="% Return")

BHAR20050812 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20050812.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20050812$DATE <- as.Date(as.character(BHAR20050812$DATE), format="%Y%m%d")
#BHAR20050812$DATE <- as.character(BHAR20050812$DATE)
BHAR20050812$BHAR <- (exp(cumsum(log(1+BHAR20050812$ARET)))) - (exp(cumsum(log(1+BHAR20050812$mret))))

BHAR20050812G <- ggplot(BHAR20050812) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / RiverBend Designs: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2005-06-06", y="% Return")

x11()
grid.arrange(ACAR20050812G, BHAR20050812G, ncol=2)
#########################################################################
#2007-01-23
ACAR20070123 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20070123.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20070123$DATE <- as.Date(as.character(ACAR20070123$DATE), format="%Y%m%d")
ACAR20070123$DATE <- as.character(ACAR20070123$DATE)

ACAR20070123G <- ggplot(ACAR20070123) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / Radius Medical: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2007-01-23", y="% Return")

BHAR20070123 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20070123.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20070123$DATE <- as.Date(as.character(BHAR20070123$DATE), format="%Y%m%d")
#BHAR20070123$DATE <- as.character(BHAR20070123$DATE)
BHAR20070123$BHAR <- (exp(cumsum(log(1+BHAR20070123$ARET)))) - (exp(cumsum(log(1+BHAR20070123$mret))))

BHAR20070123G <- ggplot(BHAR20070123) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / Radius Medical: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2007-01-2", y="% Return")

x11()
grid.arrange(ACAR20070123G, BHAR20070123G, ncol=2)
#########################################################################
#2008-05-08
ACAR20080508 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20080508.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20080508$DATE <- as.Date(as.character(ACAR20080508$DATE), format="%Y%m%d")
ACAR20080508$DATE <- as.character(ACAR20080508$DATE)

ACAR20080508G <- ggplot(ACAR20080508) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / Osiris Therapeutics: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2008-05-08", y="% Return")

BHAR20080508 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20080508.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20080508$DATE <- as.Date(as.character(BHAR20080508$DATE), format="%Y%m%d")
#BHAR20080508$DATE <- as.character(BHAR20080508$DATE)
BHAR20080508$BHAR <- (exp(cumsum(log(1+BHAR20080508$ARET)))) - (exp(cumsum(log(1+BHAR20080508$mret))))

BHAR20080508G <- ggplot(BHAR20080508) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / Osiris Therapeutics: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2008-05-08", y="% Return")

x11()
grid.arrange(ACAR20080508G, BHAR20080508G, ncol=2)
#########################################################################
#2009-04-22
ACAR20090422 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20090422.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20090422$DATE <- as.Date(as.character(ACAR20090422$DATE), format="%Y%m%d")
ACAR20090422$DATE <- as.character(ACAR20090422$DATE)

ACAR20090422G <- ggplot(ACAR20090422) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / Cervitech: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2009-04-22", y="% Return")

BHAR20090422 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20090422.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20090422$DATE <- as.Date(as.character(BHAR20090422$DATE), format="%Y%m%d")
#BHAR20090422$DATE <- as.character(BHAR20090422$DATE)
BHAR20090422$BHAR <- (exp(cumsum(log(1+BHAR20090422$ARET)))) - (exp(cumsum(log(1+BHAR20090422$mret))))

BHAR20090422G <- ggplot(BHAR20090422) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / Cervitech: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2009-04-22", y="% Return")

x11()
grid.arrange(ACAR20090422G, BHAR20090422G, ncol=2)
#########################################################################
#2013-05-06
ACAR20130506 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20130506.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20130506$DATE <- as.Date(as.character(ACAR20130506$DATE), format="%Y%m%d")
ACAR20130506$DATE <- as.character(ACAR20130506$DATE)

ACAR20130506G <- ggplot(ACAR20130506) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / ANC: 5-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2013-05-06", y="% Return")

BHAR20130506 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20130506.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20130506$DATE <- as.Date(as.character(BHAR20130506$DATE), format="%Y%m%d")
#BHAR20130506$DATE <- as.character(BHAR20130506$DATE)
BHAR20130506$BHAR <- (exp(cumsum(log(1+BHAR20130506$ARET)))) - (exp(cumsum(log(1+BHAR20130506$mret))))

BHAR20130506G <- ggplot(BHAR20130506) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / ANC: 36-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2013-05-06", y="% Return")

x11()
grid.arrange(ACAR20130506G, BHAR20130506G, ncol=2)

#########################################################################
#2016-01-05
ACAR20160105 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20160105.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20160105$DATE <- as.Date(as.character(ACAR20160105$DATE), format="%Y%m%d")
ACAR20160105$DATE <- as.character(ACAR20160105$DATE)

ACAR20160105G <- ggplot(ACAR20160105) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / Ellipse Technologies: 4-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2016-01-05", y="% Return")

BHAR20160105 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20160105.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20160105$DATE <- as.Date(as.character(BHAR20160105$DATE), format="%Y%m%d")
#BHAR20160105$DATE <- as.character(BHAR20160105$DATE)
BHAR20160105$BHAR <- (exp(cumsum(log(1+BHAR20160105$ARET)))) - (exp(cumsum(log(1+BHAR20160105$mret))))

BHAR20160105G <- ggplot(BHAR20160105) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / Ellipse Technologies: 12-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2016-01-05", y="% Return")

x11()
grid.arrange(ACAR20160105G, BHAR20160105G, ncol=2)

#########################################################################
#2016-06-06
ACAR20160606 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/ACAR20160606.csv", header = TRUE, stringsAsFactors = FALSE)
ACAR20160606$DATE <- as.Date(as.character(ACAR20160606$DATE), format="%Y%m%d")
ACAR20160606$DATE <- as.character(ACAR20160606$DATE)

x11()
ggplot(ACAR20160606) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=AbnRet), group=1, color = 'red') +
  labs(title = "NuVasive / Biotronic NeuroNetwork: 4-Day Cumulative Abnormal Returns (CARs)", subtitle="Market return (Black), NuVasive return Blue), NuVasive 5-Day CARs (Red)",
       x ="Acquisition Announcement Date: 2016-06-06", y="% Return")

BHAR20160606 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/BHAR20160606.csv", header = TRUE, stringsAsFactors = FALSE)
BHAR20160606$DATE <- as.Date(as.character(BHAR20160606$DATE), format="%Y%m%d")
#BHAR20160606$DATE <- as.character(BHAR20160606$DATE)
BHAR20160606$BHAR <- (exp(cumsum(log(1+BHAR20160606$ARET)))) - (exp(cumsum(log(1+BHAR20160606$mret))))

BHAR20160606G <- ggplot(BHAR20160606) +
  geom_line(aes(x=DATE, y=mret), group=1, color = 'black') +
  geom_line(aes(x=DATE, y=ARET), group=1, color = 'blue') +
  geom_line(aes(x=DATE, y=BHAR), group=1, color = 'red') +
  labs(title = "NuVasive / Biotronic NeuroNetwork: 12-Month Buy-and-Hold Abnormal Returns (BHARs)", subtitle="Market return (Black), NuVasive return, (Blue), NuVasive 36-Mon BHARs (Red)",
       x ="Acquisition Announcement Date: 2016-06-06", y="% Return")

x11()
grid.arrange(ACAR20160606G, BHAR20160606G, ncol=2)

###################################################
#3841 Primary Only Histogram:

Hist3841PrimOnly <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/MD_AllPrime3841SUNDAY.csv", header = TRUE, stringsAsFactors = FALSE)
Hist3841PrimOnly$DateAnnounced <- as.Date(as.character(Hist3841PrimOnly$DateAnnounced), format="%m/%d/%Y")
Hist3841PrimOnly$Year <- substr(Hist3841PrimOnly$DateAnnounced, 1, 4)
Hist3841PrimOnly$Year <- as.factor(Hist3841PrimOnly$Year)

x11()
ggplot(Hist3841PrimOnly, aes(Year)) +
  geom_bar() +
  labs(x="Year", y="# of M&A transactions") +
  ggtitle("M&A Frequency: Primary SIC 3841 Only")
################################################################
#All 3841 Histogram:

All3841 <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/Md_All3841SUNDAY.csv", header = TRUE, stringsAsFactors = FALSE)
All3841$DateAnnounced <- as.Date(as.character(All3841$DateAnnounced), format="%m/%d/%Y")
All3841$Year <- substr(All3841$DateAnnounced, 1, 4)
All3841$Year <- as.factor(All3841$Year)

x11()
ggplot(All3841, aes(Year)) +
  geom_bar() +
  labs(x="Year", y="# of M&A transactions") +
  ggtitle("M&A Frequency: All Firms Operating with an SIC 3841")

################################################################
#All Histogram:

All <- read.csv("/Users/gregoryrobinson/Desktop/ Greg Mac/Jobs/NuVasive/GraphData/MD_allcleansun_fin.csv", header = TRUE, stringsAsFactors = FALSE)
All$DateAnnounced <- as.Date(as.character(All$DateAnnounced), format="%m/%d/%Y")
All$Year <- substr(All$DateAnnounced, 1, 4)
All$Year <- as.factor(All$Year)

x11()
ggplot(All, aes(Year)) +
  geom_bar() +
  labs(x="Year", y="# of M&A transactions") +
  ggtitle("M&A Frequency: All Firms")











