/*Problem 2*/
RAW_STATIONS = LOAD 'stationlistshort.txt' AS (usaf: int, wban:int, location:chararray);
RAW_TEMPS = LOAD '19011910.txt' AS (usaf:int, wban:int, year:chararray, temp:int);
RAW_MERGING = JOIN RAW_STATIONS by $0, RAW_TEMPS by $0;

/*RAW_MERGING table contains repeated data so I will remove these values*/
MERGING = FOREACH RAW_MERGING GENERATE $0,$1,$2,$5,$6;

/*Filter to only include the trusted observations*/
FILTERED = FILTER MERGING BY RAW_TEMPS::temp != 9999 AND RAW_STATIONS::wban IN (0,1,4,5,9,99999);

/*Group by year*/
GROUPED = GROUP FILTERED BY $2;

/*Create result	table*/
RESULT = FOREACH GROUPED GENERATE group, COUNT(FILTERED.RAW_STATIONS::wban), MAX(FILTERED.RAW_TEMPS::temp), MIN(FILTERED.RAW_TEMPS::temp);
DUMP RESULT;
