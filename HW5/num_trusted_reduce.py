#!/usr/bin/env python

import sys

(last_key, cur_count) = (None, 0)
for line in sys.stdin:
  (key, val) = line.strip().split("\t")
  if last_key and last_key != key:
    print "%s\t%s" % (last_key, mur_count)
    (last_key, cur_count) = (key, int(val))
  else:
    (last_key, cur_count) = (key, cur_count + int(val))

if last_key:
  print "%s\t%s" % (last_key, cur_count)
