/*Problem 1*/
RAW_STATIONS = LOAD 'stationlistshort.txt' AS (usaf: int, wban:int, location:chararray);
RAW_TEMPS = LOAD '19011910.txt' AS (usaf:int, wban:int, year:chararray, temp:int);
RAW_MERGING = JOIN RAW_STATIONS by $0, RAW_TEMPS by $0;

/*RAW_MERGING table contains repeated data so I will remove these values*/
MERGING = FOREACH RAW_MERGING GENERATE $0,$1,$2,$5,$6;

RESULT = LIMIT MERGING 10;

/*Store and print results*/
STORE RESULT INTO 'Problem1Result';
DUMP RESULT;
