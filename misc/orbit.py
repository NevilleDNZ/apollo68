#!/usr/bin/env python

from math import *
#import re#
import locale
locale.setlocale(locale.LC_ALL, '')

def nice_print(k,v):
        if v>=1000: 
          print "# %-10s"%k+":","%44s"%locale.currency(v, symbol=False, grouping=True),
          print "=>",v
        else: print "# %-10s"%k+":",v

def dump(*arg, **args):
  kv=V.items()
  kv.sort()
  for kk in arg:
     for k in kk.split():
       if k in kv: nice_print(k,kv[k])
     else: print k,
  for k,v in kv:
    if k not in prev:
      try:
        nice_print(k,v)
      except exception: print exception
  print "-------- 8>< - - - - - - - -  - - - - - - - -"
  prev.update(V)

V=vars()
prev={}
prev.update(vars())

km=1000
G=6.6e-11
day=60*60*24

m_e=5.972e24
m_s=1.9891e30

o_se_r=150e6*1000
o_se_p=365.24222*24*60*60
o_se_dist=2*pi*o_se_r
dump()

travel_1d=o_se_dist/day
g_over_rsq=G/(o_se_r**2)
f_g=G*m_e*m_s/(o_se_r**2)
dump()

vel=o_se_dist/o_se_p
a_c=vel*vel/o_se_r
f_c=m_e*a_c
dump()
# 0.006028 m/s^2  (meters per second squared) wolfram sun's gravity on earth. seems OK
# 22.4994x10^6  meters travelled in 1 day (22,499,400m) Compare 150,000,000,000 radius
# 150000000000/22499400 => 6666.844

# f=m*a
a_e=f_g/m_e
a_s=f_g/m_s
dump()

dv_1d=a_e*day
dd_1d=(dv_1d+0)/2*day
dump()

print "dd_1d is the amount that the earth falls into the sun every day"
sin_1d=sin(2*pi/o_se_p*day)
escape=sin_1d**2 * o_se_r # this looks correct
dump()

compare=dd_1d/escape
Compare=escape/dd_1d
dump()
rel_rad_dd_1d=o_se_r/dd_1d
rel_rad_escape=o_se_r/escape
dump()
r3=G*m_s*o_se_p**2/(4*pi**2)
R=r3 ** (1.0/3)
dump()
"""
Mean radius 	1,737.10 km  (0.273 Earths)[1][3]
Equatorial radius 	1,738.14 km (0.273 Earths)[3]
Polar radius 	1,735.97 km  (0.273 Earths)
"""
e_r=6356.8*km;
o_ae_r=e_r+(190*km + 179.3*km)
#period=2*pi*sqrt((o_ae_r/G/m_e))
#period1=2*pi*sqrt((o_ae_r**3/G/m_e))
#period3=2*pi*o_ae_r*sqrt((o_ae_r**3/G/m_e))
#period4=2*pi*sqrt((o_ae_r*G*m_e))
period5=2*pi*sqrt((o_ae_r**3/(G*m_e)))
O_ae_r=o_ae_r
M_e=m_e
manual=pi*2*sqrt(8e18/6.6e-11/6e24)
dump()
