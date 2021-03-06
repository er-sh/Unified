function lbrBodyJacobian5_return = lbrBodyJacobian5_(q)
  A = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0;];
  t3 = q(5);
  t4 = cos(t3);
  t5 = q(2);
  t6 = sin(t5);
  t7 = t4 * t6;
  t8 = q(3);
  t9 = sin(t8);
  t10 = q(4);
  t11 = cos(t10);
  t12 = t9 * t11;
  t15 = cos(t8);
  t16 = t6 * t15;
  t17 = sin(t3);
  t20 = t6 * t9;
  t21 = t4 * t20;
  t23 = cos(t5);
  t25 = sin(t10);
  t26 = t17 * t23 * t25;
  t29 = t11 * t15;
  t30 = t17 * t6 * t29;
  A(1,1) = -0.4000000000e0 * t7 * t12 - 0.4000000000e0 * t17 * t16 - 0.3900000000e0 * t21 + 0.3900000000e0 * t26 - 0.3900000000e0 * t30;
  t33 = t4 * t23 * t25;
  t35 = t29 * t7;
  t37 = t20 * t17;
  t41 = t17 * t11;
  A(1,2) = 0.3900000000e0 * t33 - 0.3900000000e0 * t35 + 0.3900000000e0 * t37 - 0.4000000000e0 * t4 * t16 + 0.4000000000e0 * t20 * t41;
  A(1,3) = -0.4000000000e0 * t25 * t20;
  A(1,4) = t35 - t33 - t37;
  A(1,5) = -t30 + t26 - t21;
  A(1,6) = t16 * t25 + t23 * t11;
  t48 = t11 * t4;
  t51 = t4 * t15;
  t53 = t12 * t17;
  A(2,1) = -0.4000000000e0 * t48 * t15 - 0.3900000000e0 * t51 + 0.3900000000e0 * t53 + 0.4000000000e0 * t9 * t17;
  t57 = t12 * t4;
  t59 = t17 * t15;
  A(2,2) = 0.3900000000e0 * t57 + 0.3900000000e0 * t59 + 0.4000000000e0 * t29 * t17 + 0.4000000000e0 * t4 * t9;
  A(2,3) = -0.4000000000e0 * t25 * t15;
  A(2,4) = -t57 - t59;
  A(2,5) = t53 - t51;
  A(2,6) = -t9 * t25;
  t69 = q(1);
  t70 = cos(t69);
  t71 = t70 * t23;
  t72 = sin(t69);
  t76 = t71 * t9;
  t78 = t17 * t72 * t15;
  t81 = t15 ^ 2;
  t82 = t72 * t81;
  t85 = t11 * t70 * t23;
  t89 = t72 * t15 * t4;
  t91 = t70 * t6 * t25;
  A(3,1) = -0.2000000000e-17 * t25 * (-0.1950000000e18 * t17 - 0.7e1 * t71 * t48 * t72 - 0.14e2 * t76 * t78 + 0.14e2 * t82 * t4 * t85 + 0.7e1 * t89 * t91);
  A(3,2) = 0.2000000000e-17 * t25 * (0.1950000000e18 * t4 + 0.14e2 * t76 * t89 + 0.14e2 * t82 * t17 * t85 + 0.7e1 * t78 * t91 - 0.7e1 * t71 * t41 * t72);
  A(3,3) = 0.1400000000e-16 * t25 * t70 * t72 * (t23 * t25 - 0.2e1 * t81 * t25 * t23 + t16 * t11);
  A(3,4) = -t25 * t4;
  A(3,5) = t25 * t17;
  A(3,6) = t11;
  A(4,1) = 0.3900000000e0 * t4;
  A(4,2) = -0.3900000000e0 * t17;
  A(4,3) = 0.0e0;
  A(4,4) = t17;
  A(4,5) = t4;
  A(4,6) = 0.0e0;
  A(5,1) = 0.0e0;
  A(5,2) = 0.0e0;
  A(5,3) = 0.0e0;
  A(5,4) = 0.0e0;
  A(5,5) = 0.0e0;
  A(5,6) = 0.1e1;
  A(6,1) = 0.0e0;
  A(6,2) = 0.0e0;
  A(6,3) = 0.0e0;
  A(6,4) = 0.0e0;
  A(6,5) = 0.0e0;
  A(6,6) = 0.0e0;
  A(7,1) = 0.0e0;
  A(7,2) = 0.0e0;
  A(7,3) = 0.0e0;
  A(7,4) = 0.0e0;
  A(7,5) = 0.0e0;
  A(7,6) = 0.0e0;
  lbrBodyJacobian5_return = A;
