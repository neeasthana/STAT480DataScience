################## AIRLINES README ##################
Contained below is information regarding a commonly used airlines data set and additional resource files that could be used with the airlines data for analysis. 

Source information as well as names of processed data files (where relevant) are provided under DATA SETS. Variable descriptions for the data sets are provide by data set in section following the AIRLINES DATA DOWNLOAD section

Scripts described below were created by James Balamuta,  March 2015.

################## DATA SETS ##################
1. airlines 
The Airlines Dataset comes from the US Department of Transportations Bureau of Transportation Statistics (BTS)

To download the inital raw data, see the BTS Data Selector:
http://www.transtats.bts.gov/OT_Delay/NewAirportList.asp?xpage=OT_DelayCause1.asp&flag=undefined

A script for downloading data from year ranges is provided in the AIRLINES DATA DOWNLOAD section below.

2. airports (airports.csv)
The Airport data set comes from the Open Flights initiative found here:
http://openflights.org/data.html

3. carriers (carriers.csv)
The Carriers Dataset comes from the US Department of Transportations Bureau of Transportation Statistics (BTS)
http://www.transtats.bts.gov/Download_Lookup.asp?Lookup=L_UNIQUE_CARRIERS

4. plane-data (plane-data.csv)
The Plane Data Dataset comes from the FAA registration database found here:
http://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download/


################## AIRLINES DATA DOWNLOAD ##################

The airlines data has already been downloaded from that source and is available here:
http://stat-computing.org/dataexpo/2009/the-data.html

James Balamuta has written a download script that will download and format the data. The script is located here:
https://github.com/coatless/stat490uiuc/blob/master/airlines/airlines_data.sh

Specifically, the script will:
1. Download the data from a provided year range.
2. Unzip the data.
3. Combine the data into one file: airlines.csv
4. Clean up after itself (e.g. delete directory and itself)

To use the script:

# Download script
wget https://raw.githubusercontent.com/coatless/stat490uiuc/master/airlines/airlines_data.sh
chmod u+x airlines_data.sh

# Run the script
./airlines_data.sh <start year> <end year> 


################## AIRLINES VARIABLES ##################
There are 29 variables in the total data set.

Variable Information:

Col	Variable Name		Description
1	Year			Year from within 1987-2008
2	Month			Month from within 1-12
3	DayofMonth		Day from within 1-31
4	DayOfWeek		Day of Week from within 1 (Monday) - 7 (Sunday)
5	DepTime			Actual Departure Time (local time: hhmm)
6	CRSDepTime		Scheduled Departure Time (local time: hhmm)
7	ArrTime			Actual Arrival Time (local time: hhmm)
8	CRSArrTime		Scheduled Arrival Time (local time: hhmm)
9	UniqueCarrier		Unique Carrier Code. When the same code has been used by multiple carriers, a numeric suffix is used for earlier users, for example, PA, PA(1), PA(2). Use this field for analysis across a range of years.
10	FlightNum		Flight Number
11	TailNum			Plane Tail Number
12	ActualElapsedTime	Actual Elapsed Time of Flight, in Minutes
13	CRSElapsedTime		Scheduled Elapsed Time of Flight, in Minutes
14	AirTime			Flight Time, in Minutes
15	ArrDelay		Difference in minutes between scheduled and actual arrival time. Early arrivals show negative numbers.
16	DepDelay		Difference in minutes between scheduled and actual departure time. Early departures show negative numbers.
17	Origin			Origin IATA Airport Code
18	Dest			Destination IATA Airport Code
19	Distance		Distance between airports (miles)
20	TaxiIn			Taxi In Time, in Minutes
21	TaxiOut			Taxi Out Time, in minutes
22	Cancelled		Cancelled Flight Indicator (1 = Yes, 0 = No)
23	CancellationCode	Specifies The Reason For Cancellation (A = carrier, B = weather, C = NAS, D = security)
24	Diverted		Diverted Flight Indicator (1 = Yes, 0 = No)
25	CarrierDelay		Carrier Delay, in Minutes
26	WeatherDelay		Weather Delay, in Minutes
27	NASDelay		National Air System Delay, in Minutes
28	SecurityDelay		Security Delay, in Minutes
29	LateAircraftDelay	Late Aircraft Delay, in Minutes

Missingness in Variables
The following data is missing:

Year Span	Variable Data Missing
1987 - 1994 	TailNum, TaxiIn, TaxiOut, Cancelled, CancellationCode
1987 - 2003	CancellationCode, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay

Information taken from:
http://www.transtats.bts.gov/Fields.asp?Table_ID=236


################## AIRPORTS VARIABLES ##################
There are 7 variables in the total data set.

Variable Information:

Col	Variable Name		Description
1	iata			IATA airport code (e.g. ORD)
2	airport			Name of Airport (e.g. O'Hare Airport)
3	city			City Airport Resides in (e.g. Chicago)
4	state			State Airport Resides in (e.g. IL)
5	country			Country Airport Resides in (e.g. USA)
6	lat			Latitude of Airport Location 
7	long			Longitude of Airport Location


################## CARRIERS VARIABLES ##################
There are 2 variables in the total data set.

Variable Information:

Col	Variable Name		Description
1	Code			Carrier code (e.g. AA )
2	Description		Name of Carrier (e.g. American Airlines Inc.)


################## PLANE-DATA VARIABLES ##################
There are 2 variables in the total data set.

Variable Information:

Col	Variable Name		Description
1	tailnum			Plane Tail Number (e.g. N199UA)
2	type			Type of Registration (e.g. CORPORATION)
3	manufacturer		Manufacturer of Plane (e.g. Boeing)
4	issue_date		Certificate Issued Date, MM/DD/YYYY
5	model			Model of Plane (e.g. 747-422)
6	status			Registration Okay (e.g. Valid, missing means no)
7	aircraft_type		Type of Aircraft 
8	engine_type		Type of Engine
9	year			Year Manufactured

For more information on the variables or to add to the table, see:
http://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/media/ardata.pdf

################## OTHER DATA SETS ##################
Weather information could also be interesting relative to flight delays, for instance. Though not provided in files here, weather
data sets can be downloaded from:

Weather Underground - http://www.wunderground.com/history
NOAA - http://www.ncdc.noaa.gov/data-access/quick-links
Aviation Weather -
http://www.aviationweather.gov/adds/tafs/
http://www.aviationweather.gov/adds/metars/

to include weather information in analyses.


