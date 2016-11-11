function lbrT0_4_return = lbrT0_4_(q)
  T0_4 = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0;];
  t1 = q(1);
  t2 = cos(t1);
  t3 = q(2);
  t4 = cos(t3);
  t5 = t2 * t4;
  t6 = q(3);
  t7 = cos(t6);
  t9 = sin(t1);
  t10 = sin(t6);
  t12 = t5 * t7 - t9 * t10;
  t13 = q(4);
  t14 = cos(t13);
  t16 = sin(t3);
  t17 = t16 * t2;
  t18 = sin(t13);
  T0_4(1,1) = t12 * t14 + t18 * t17;
  T0_4(1,2) = -t12 * t18 + t17 * t14;
  T0_4(1,3) = -t5 * t10 - t7 * t9;
  T0_4(1,4) = t17 * (-0.400000000000000022e0);
  t25 = t9 * t4;
  t28 = t25 * t7 + t2 * t10;
  t30 = t9 * t16;
  T0_4(2,1) = t28 * t14 + t18 * t30;
  T0_4(2,2) = -t28 * t18 + t14 * t30;
  T0_4(2,3) = -t25 * t10 + t7 * t2;
  T0_4(2,4) = t30 * (-0.400000000000000022e0);
  t37 = t16 * t7;
  T0_4(3,1) = t37 * t14 - t4 * t18;
  T0_4(3,2) = -t37 * t18 - t4 * t14;
  T0_4(3,3) = -t16 * t10;
  T0_4(3,4) = 0.309999999999999998e0 + t4 * 0.400000000000000022e0;
  T0_4(4,1) = 0.0e0;
  T0_4(4,2) = 0.0e0;
  T0_4(4,3) = 0.0e0;
  T0_4(4,4) = 0.1e1;
  lbrT0_4_return = T0_4;