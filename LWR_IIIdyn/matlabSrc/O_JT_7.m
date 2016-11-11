function lbrZeroJacobian7_return = lbrZeroJacobian7_(q)
  A = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0;];
  t3 = q(4);
  t4 = sin(t3);
  t5 = q(1);
  t6 = sin(t5);
  t7 = t4 * t6;
  t8 = q(2);
  t9 = cos(t8);
  t10 = q(3);
  t11 = cos(t10);
  t12 = t9 * t11;
  t13 = t7 * t12;
  t15 = cos(t5);
  t16 = t4 * t15;
  t17 = sin(t10);
  t18 = t17 * t16;
  t20 = sin(t8);
  t21 = t6 * t20;
  t22 = cos(t3);
  t23 = t21 * t22;
  A(1,1) = -0.3900000000e0 * t13 - 0.3900000000e0 * t18 + 0.3900000000e0 * t23 + 0.4000000000e0 * t21;
  t26 = t12 * t16;
  t28 = t7 * t17;
  t30 = t15 * t20;
  t31 = t30 * t22;
  A(1,2) = 0.3900000000e0 * t26 - 0.3900000000e0 * t28 - 0.3900000000e0 * t31 - 0.4000000000e0 * t30;
  A(1,3) = 0.0e0;
  A(1,4) = 0.0e0;
  A(1,5) = 0.0e0;
  A(1,6) = 0.1e1;
  t34 = t20 * t11;
  t35 = t34 * t4;
  t37 = t9 * t22;
  t40 = 0.39e2 * t35 + 0.39e2 * t37 + 0.40e2 * t9;
  A(2,1) = -0.1000000000e-1 * t15 * t40;
  A(2,2) = -0.1000000000e-1 * t6 * t40;
  t47 = t20 * t22;
  A(2,3) = 0.3900000000e0 * t4 * t12 - 0.3900000000e0 * t47 - 0.4000000000e0 * t20;
  A(2,4) = t6;
  A(2,5) = -t15;
  A(2,6) = 0.0e0;
  t51 = t15 * t9 * t17;
  t52 = A(2,4) * t11;
  t53 = t51 + t52;
  A(3,1) = t4 * t53 * (-0.390000000000000014e0);
  t57 = A(2,4) * t9 * t17;
  t58 = t15 * t11;
  A(3,2) = -0.3900000000e0 * (t57 - 0.1e1 * t58) * t4;
  t63 = t20 * t17;
  A(3,3) = t63 * t4 * (-0.390000000000000014e0);
  A(3,4) = -t30;
  A(3,5) = -t21;
  A(3,6) = t9;
  t66 = t15 * t22;
  t69 = t22 * A(2,4);
  t70 = t69 * t17;
  t72 = t30 * t4;
  A(4,1) = 0.3900000000e0 * t66 * t12 - 0.3900000000e0 * t70 + 0.3900000000e0 * t72;
  t76 = t66 * t17;
  t79 = A(2,4) * t20 * t4;
  A(4,2) = 0.3900000000e0 * t69 * t12 + 0.3900000000e0 * t76 + 0.3900000000e0 * t79;
  t81 = t34 * t22;
  t83 = A(3,6) * t4;
  A(4,3) = 0.3900000000e0 * t81 - 0.3900000000e0 * t83;
  A(4,4) = -t53;
  A(4,5) = -t57 + t58;
  A(4,6) = -t63;
  A(5,1) = 0.0e0;
  A(5,2) = 0.0e0;
  A(5,3) = 0.0e0;
  A(5,4) = -t31 - t28 + t26;
  A(5,5) = -t23 + t18 + t13;
  A(5,6) = t35 + t37;
  A(6,1) = 0.0e0;
  A(6,2) = 0.0e0;
  A(6,3) = 0.0e0;
  t85 = q(5);
  t86 = sin(t85);
  t87 = t86 * t22;
  t88 = A(2,4) * t17;
  t90 = cos(t85);
  t91 = t90 * A(2,4);
  t94 = t15 * A(3,6) * t11;
  t96 = t15 * t90;
  t97 = A(3,6) * t17;
  t100 = t20 * t4;
  A(6,4) = -t87 * t88 + t91 * t11 + t87 * t94 + t96 * t97 + t86 * t15 * t100;
  t105 = t17 * t15;
  t108 = A(2,4) * A(3,6) * t11;
  A(6,5) = t91 * t97 + t86 * A(2,4) * t100 + t87 * t105 + t87 * t108 - t96 * t11;
  A(6,6) = -t86 * A(3,6) * t4 + t63 * t90 + t86 * t20 * t11 * t22;
  A(7,1) = 0.0e0;
  A(7,2) = 0.0e0;
  A(7,3) = 0.0e0;
  t117 = q(6);
  t118 = cos(t117);
  t119 = t118 * t4;
  t121 = sin(t117);
  t122 = t90 * t121;
  t124 = t121 * t86;
  t131 = t122 * t22;
  A(7,4) = t119 * t94 - t122 * t72 + t124 * t52 + t124 * t51 + t122 * t70 - t118 * t15 * t47 - t119 * t88 - t131 * t94;
  A(7,5) = t119 * t108 + t124 * t57 - t124 * t58 - t122 * t79 - t118 * A(2,4) * t47 - t122 * t76 - t131 * t108 + t119 * t105;
  A(7,6) = t118 * A(3,6) * t22 - t122 * t81 + t118 * t20 * t11 * t4 + t124 * t63 + t122 * t83;
  lbrZeroJacobian7_return = A;
