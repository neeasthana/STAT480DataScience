IMPORT 'stat.macro';
 A = LOAD 'airlines.csv' USING PigStorage(',')
   AS (Year:INT, Month:INT,DayofMonth: INT,DayOfWeek: INT,DepTime: INT,CRSDepTime: INT,
   ArrTime: INT,CRSArrTime: INT,UniqueCarrier: chararray,FlightNum: INT,TailNum: chararray,
  ActualElapsedTime: INT,CRSElapsedTime: INT,AirTime: INT,ArrDelay: INT,DepDelay: INT,
  Origin:chararray,Dest: chararray,Distance: INT,TaxiIn: INT,TaxiOut: INT,Cancelled: INT,
  CancellationCode: INT,Diverted: INT,CarrierDelay: INT,WeatherDelay: INT,NASDelay: INT,
  SecurityDelay: INT,LateAircraftDelay:INT);
ave_delay = stat_by_group(A, DayofMonth, ArrDelay);
STORE ave_delay INTO 'day_ave';
