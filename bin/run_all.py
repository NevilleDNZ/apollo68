#!/usr/bin/env python
import os, string
# opt="-O3";
opt=""
ms="1 2 3" # euler ab rk4
ml="Euler Adams_Bashforth Runga_Kutta_4th_order Velocity_Verlet".split(" ")
rl="19years 1year 1month 1week 3day 1day 4xAp8_orbit".split(" ")
detail="_short_10TonneMoon"
detail="_short_10TonneMoon"
detail="_short_with_moon"
detail="_ss=1hr_short_no_moon"
detail="_ss=1hr_short_with_moon"
detail="_ss_1m"
detail="_ss_1s"

      #1# 19 * topical year, # Metonic cycle #
      #2# topical year,
      #3# sidereal month,
      #4# sidereal month / 4,
      #5# 3 * days,
      #6# 24 * hours,
      #7# 3.64307227890746 * hours # orbit time prior to Lunar inje
def atoi(l):
  return [ string.atoi(s) for s in l ]

rs="1 2 3 4 5" # 19y .. 1d
#rs=1 # 19 years!!
ms="1 2 3 4"
rs="2 3 4 5 6 7"
rs="6"
ms=atoi(ms.split())
rs=atoi(rs.split())

for m in ms:
  print m
  m_desc = "m_"+ml[m-1]
  for r in rs:
    r_desc= "r_"+rl[r-1]
    print "./run_mission.sh %(opt)s %(m)s %(r)s | tail -f %(m_desc)s_%(r_desc)s%(detail)s%(opt)s.lst" %vars()
    os.system("(/usr/bin/time ./run_mission.sh %(opt)s %(m)s %(r)s 2>&1) | tee %(m_desc)s_%(r_desc)s%(detail)s%(opt)s.lst"%vars())
