#!/usr/bin/python

from numpy import *

q = zeros((7), dtype=float)
T = zeros((4,4), dtype=float)
J = zeros((7,6), dtype=float)
import LWR_IIIdyn

print "########################################"
print " TRANSFORMATIONS"
print
LWR_IIIdyn.lbrT0_1(q,T)
print T
print
LWR_IIIdyn.lbrT0_2(q,T)
print T
print
LWR_IIIdyn.lbrT0_3(q,T)
print T
print
LWR_IIIdyn.lbrT0_4(q,T)
print T
print
LWR_IIIdyn.lbrT0_5(q,T)
print T
print
LWR_IIIdyn.lbrT0_6(q,T)
print T
print
LWR_IIIdyn.lbrT0_7(q,T)
print T
print

print
print "########################################"
print " ZERO JACOBIANS"
print
LWR_IIIdyn.lbr0JT1(q, J);
print J
print
LWR_IIIdyn.lbr0JT2(q, J);
print J
print
LWR_IIIdyn.lbr0JT3(q, J);
print J
print
LWR_IIIdyn.lbr0JT4(q, J);
print J
print
LWR_IIIdyn.lbr0JT5(q, J);
print J
print
LWR_IIIdyn.lbr0JT6(q, J);
print J
print
LWR_IIIdyn.lbr0JT7(q, J);
print J
print

print
print "########################################"
print " BODY JACOBIANS"
print
LWR_IIIdyn.lbr1JT1(q, J);
print J
print
LWR_IIIdyn.lbr2JT2(q, J);
print J
print
LWR_IIIdyn.lbr3JT3(q, J);
print J
print
LWR_IIIdyn.lbr4JT4(q, J);
print J
print
LWR_IIIdyn.lbr5JT5(q, J);
print J
print
LWR_IIIdyn.lbr6JT6(q, J);
print J
print
LWR_IIIdyn.lbr7JT7(q, J);
print J
print
