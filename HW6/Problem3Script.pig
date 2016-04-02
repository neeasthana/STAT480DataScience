/*Problem 3*/
STATIONS = LOAD 'stationlistshort.txt' AS (usaf: int, wban:int, location:chararray);
TEMPS = LOAD '19011910.txt' AS (usaf:int, wban:int, year:chararray, temp:int);
RAW_MERGING = JOIN STATIONS by $0, TEMPS by $0;

/*RAW_MERGING table contains repeated data so I will remove these values*/
MERGING = FOREACH RAW_MERGING GENERATE $0,$1,$2,$5,$6;

/*Get only the records that are from Turku*/
TURKU = FILTER MERGING BY $2 == 'TURKU';

/*Group by year*/
YEAR = GROUP TURKU by TEMPS::year;

/*Generate the result*/
RESULT = FOREACH YEAR GENERATE group, MIN(TURKU.TEMPS::temp), MAX(TURKU.TEMPS::temp);
DUMP RESULT;
