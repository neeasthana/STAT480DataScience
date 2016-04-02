/*Problem 4*/
STATIONS = LOAD 'stationlistshort.txt' AS (usaf: int, wban:int, location:chararray);
TEMPS = LOAD '19011910.txt' AS (usaf:int, wban:int, year:chararray, temp:int);
RAW_MERGING = JOIN STATIONS by $0, TEMPS by $0;

/*RAW_MERGING table contains repeated data so I will remove these values*/
MERGING = FOREACH RAW_MERGING GENERATE $0,$1,$2,$5,$6;

/*Filter to only include the trusted observations*/
FILTERED = FILTER MERGING BY TEMPS::temp != 9999 AND STATIONS::wban IN (0,1,4,5,9,99999);

/*Group by year*/
GROUPED = GROUP FILTERED BY $2;

/*Create table range of temps for each station*/
MAXMIN = FOREACH GROUPED GENERATE group, MAX(FILTERED.TEMPS::temp), MIN(FILTERED.TEMPS::temp);
RANGES = FOREACH MAXMIN GENERATE group, $1-$2;

/*Get Station with the lowest range*/
ORDERED_RANGES = ORDER RANGES BY $1;
LOWEST = LIMIT ORDERED_RANGES 1;

/*Create table with only observations from the lowest range temperature station*/
RAW_ONLY_LOWEST = JOIN LOWEST by $0, FILTERED by STATIONS::location;
ONLY_LOWEST = FOREACH RAW_ONLY_LOWEST GENERATE $0,$2,$3,$5,$6;

/*Group by Year and obtain result*/
YEAR = GROUP ONLY_LOWEST BY $3;
RESULT = FOREACH YEAR GENERATE group, MAX(ONLY_LOWEST.FILTERED::TEMPS::temp), MIN(ONLY_LOWEST.FILTERED::TEMPS::temp);

/*Store and Display Results*/
STORE RESULT INTO 'Problem4Result';
DUMP RESULT;

