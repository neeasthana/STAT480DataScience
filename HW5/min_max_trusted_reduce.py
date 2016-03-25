#!/usr/bin/env python

import sys

(last_key, cur_count, min_temp, max_temp) = (None, 0, sys.maxint, -sys.maxint)
for line in sys.stdin:
  (key, val, temp1, temp2) = line.strip().split("\t")
  if last_key and last_key != key:
    print "%s\t%s\t%s\t%s" % (last_key, cur_count, min_temp, max_temp)
    (last_key, cur_count, min_temp, max_temp) = (key, int(val), int(temp1), int(temp2))
  else:
    (last_key, cur_count, min_temp, max_temp) = (key, cur_count + int(val), min(min_temp, int(temp1)), max(max_temp, int(temp2)))

if last_key:
  print "%s\t%s\t%s\t%s" % (last_key, cur_count, min_temp, max_temp)
