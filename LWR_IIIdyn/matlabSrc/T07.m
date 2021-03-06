function lbrT0_7_return = lbrT0_7_(q)
  T0_7 = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0;];
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
  t38 = t29 * t31 + t35 * t36;
  t39 = q(7);
  t40 = cos(t39);
  t44 = t20 * t27 - t22 * t26;
  t45 = sin(t39);
  T0_7(1,1) = t40 * t38 - t44 * t45;
  T0_7(1,2) = -t38 * t45 - t44 * t40;
  T0_7(1,3) = -t29 * t36 + t35 * t31;
  T0_7(1,4) = t33 * 0.390000000000000014e0 + t34 * (-0.390000000000000014e0) + t17 * (-0.400000000000000022e0);
  t54 = t9 * t4;
  t57 = t54 * t7 + t2 * t10;
  t59 = t9 * t16;
  t61 = t57 * t14 + t59 * t18;
  t65 = -t54 * t10 + t2 * t7;
  t67 = t61 * t22 + t65 * t27;
  t69 = t57 * t18;
  t70 = t59 * t14;
  t71 = t69 - t70;
  t73 = t67 * t31 + t71 * t36;
  t77 = t61 * t27 - t65 * t22;
  T0_7(2,1) = t73 * t40 - t77 * t45;
  T0_7(2,2) = -t73 * t45 - t77 * t40;
  T0_7(2,3) = -t67 * t36 + t71 * t31;
  T0_7(2,4) = t69 * 0.390000000000000014e0 + t70 * (-0.390000000000000014e0) + t59 * (-0.400000000000000022e0);
  t86 = t16 * t7;
  t89 = t86 * t14 - t18 * t4;
  t91 = t16 * t10;
  t93 = t89 * t22 - t27 * t91;
  t95 = t86 * t18;
  t96 = t4 * t14;
  t97 = t95 + t96;
  t99 = t93 * t31 + t97 * t36;
  t103 = t89 * t27 + t91 * t22;
  T0_7(3,1) = t99 * t40 - t103 * t45;
  T0_7(3,2) = -t99 * t45 - t103 * t40;
  T0_7(3,3) = -t36 * t93 + t97 * t31;
  T0_7(3,4) = 0.309999999999999998e0 + t95 * 0.390000000000000014e0 + t96 * 0.390000000000000014e0 + t4 * 0.400000000000000022e0;
  T0_7(4,1) = 0.0e0;
  T0_7(4,2) = 0.0e0;
  T0_7(4,3) = 0.0e0;
  T0_7(4,4) = 0.1e1;
  lbrT0_7_return = T0_7;
