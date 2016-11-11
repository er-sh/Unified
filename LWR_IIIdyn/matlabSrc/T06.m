function lbrT0_6_return = lbrT0_6_(q)
  T0_6 = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0;];
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
  t20 = t12 * t14 + t18 * t17;
  t21 = q(5);
  t22 = cos(t21);
  t26 = -t5 * t10 - t9 * t7;
  t27 = sin(t21);
  t29 = t20 * t22 + t26 * t27;
  t30 = q(6);
  t31 = cos(t30);
  t33 = t12 * t18;
  t34 = t17 * t14;
  t35 = t33 - t34;
  t36 = sin(t30);
  T0_6(1,1) = t29 * t31 + t35 * t36;
  T0_6(1,2) = -t29 * t36 + t35 * t31;
  T0_6(1,3) = t20 * t27 - t22 * t26;
  T0_6(1,4) = t33 * 0.390000000000000014e0 + t34 * (-0.390000000000000014e0) + t17 * (-0.400000000000000022e0);
  t45 = t9 * t4;
  t48 = t45 * t7 + t2 * t10;
  t50 = t16 * t9;
  t52 = t48 * t14 + t50 * t18;
  t56 = -t45 * t10 + t2 * t7;
  t58 = t22 * t52 + t56 * t27;
  t60 = t18 * t48;
  t61 = t50 * t14;
  t62 = t60 - t61;
  T0_6(2,1) = t58 * t31 + t62 * t36;
  T0_6(2,2) = -t58 * t36 + t62 * t31;
  T0_6(2,3) = t52 * t27 - t22 * t56;
  T0_6(2,4) = t60 * 0.390000000000000014e0 + t61 * (-0.390000000000000014e0) + t50 * (-0.400000000000000022e0);
  t71 = t16 * t7;
  t74 = t71 * t14 - t4 * t18;
  t76 = t16 * t10;
  t78 = t74 * t22 - t76 * t27;
  t80 = t71 * t18;
  t81 = t4 * t14;
  t82 = t80 + t81;
  T0_6(3,1) = t78 * t31 + t82 * t36;
  T0_6(3,2) = -t78 * t36 + t82 * t31;
  T0_6(3,3) = t74 * t27 + t22 * t76;
  T0_6(3,4) = 0.309999999999999998e0 + t80 * 0.390000000000000014e0 + t81 * 0.390000000000000014e0 + t4 * 0.400000000000000022e0;
  T0_6(4,1) = 0.0e0;
  T0_6(4,2) = 0.0e0;
  T0_6(4,3) = 0.0e0;
  T0_6(4,4) = 0.1e1;
  lbrT0_6_return = T0_6;