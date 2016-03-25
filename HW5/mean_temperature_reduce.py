#!/usr/bin/env python

import sys

(last_key, cur_count, mean) = (None, 0, 0)
for line in sys.stdin:
  (key, val, valmean) = line.strip().split("\t")
  if last_key and last_key != key:
    print "%s\t%s\t%s" % (last_key, cur_count, mean)
    (last_key, cur_count, mean) = (key, int(val), float(valmean))
  else:
    first = cur_count * mean
    second = int(val) * float(valmean)
    total = cur_count + int(val)
    (last_key, cur_count, mean) = (key, total, (first+second)/total )

if last_key:
  print "%s\t%s\t%s" % (last_key, cur_count, mean)
