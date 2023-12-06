if (! require (PowerSDI)) {install.packages ("PowerSDI ")}
library(PowerSDI)
lon=-48.11 #Longitute in decimal degrees
lat=-24.81 #Latitude in decimal degrees
PlotData(lon = lon,lat = lat, start.date = "1991-01-01", end.date = "2022-12-31")
ts=8 # Time scale (8 corresponds to a 2-month moving-window)
  case.study=ScientSDI(lon=lon, lat=lat, start.date="1991-01-01", end.date="2022-12-31", 
                       TS= ts, Good="yes",RainUplim = 250)
  write.csv(case.study$SDI,"SPI_SPEI.csv")
  write.csv(case.study$DistPar,"Dist_Parameters.csv")
  write.csv(case.study$GoodFit,"Good.csv")
  write.csv(case.study$Normality ,"Normality.csv")
  case.study.Operat=OperatSDI(lon = lon, lat = lat, start.date = "2014-01-22",
                                   end.date = "2014-01-31", parms = case.study$DistPar, TS=8)
  print(case.study.Operat)
  