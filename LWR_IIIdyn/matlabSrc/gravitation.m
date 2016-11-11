function lbrGravitationalTorquesreturn = lbrGravitationalTorques(mEE, g, q, rEE)
  A = [0 0 0 0 0 0 0];
  t2 = q(2);
  t3 = sin(t2);
  t4 = q(3);
  t5 = cos(t4);
  t6 = q(4);
  t7 = cos(t6);
  t8 = q(5);
  t9 = cos(t8);
  t10 = q(6);
  t11 = cos(t10);
  t12 = q(7);
  t13 = cos(t12);
  t14 = sin(t10);
  t15 = cos(t2);
  t16 = q(1);
  t17 = cos(t16);
  t18 = g(1);
  t19 = t17 * t18;
  t20 = sin(t16);
  t21 = g(2);
  t22 = t20 * t21;
  t23 = t19 + t22;
  t24 = t15 * t23;
  t25 = g(3);
  t26 = t3 * t25;
  t27 = t24 + t26;
  t28 = t5 * t27;
  t29 = sin(t4);
  t30 = t20 * t18;
  t31 = t17 * t21;
  t32 = t30 - t31;
  t33 = t29 * t32;
  t34 = t28 - t33;
  t35 = t7 * t34;
  t36 = sin(t6);
  t37 = t3 * t23;
  t38 = t15 * t25;
  t39 = -t37 + t38;
  t40 = t36 * t39;
  t41 = t35 - t40;
  t42 = t9 * t41;
  t43 = sin(t8);
  t44 = t29 * t27;
  t45 = t5 * t32;
  t46 = -t44 - t45;
  t47 = t43 * t46;
  t48 = t42 + t47;
  t49 = t14 * t48;
  t50 = t36 * t34;
  t51 = t7 * t39;
  t52 = t50 + t51;
  t53 = t11 * t52;
  t54 = -t49 + t53;
  t55 = t54 * mEE;
  t56 = rEE(2);
  t58 = sin(t12);
  t59 = t11 * t48;
  t60 = t14 * t52;
  t61 = t59 + t60;
  t63 = t43 * t41;
  t64 = t9 * t46;
  t65 = t63 - t64;
  t67 = -t58 * t61 - t13 * t65;
  t70 = 0.1171823300e-1 + mEE * rEE(3);
  t72 = t55 * t56 - t70 * t67;
  t76 = t13 * t61 - t58 * t65;
  t78 = rEE(1);
  t80 = t76 * t70 - t55 * t78;
  t86 = t13 * t72 - t58 * t80 + 0.4439138000e-2 * t63 - 0.4439138000e-2 * t64 - 0.3576408000e-2 * t49 + 0.3576408000e-2 * t53;
  t89 = t67 * mEE * t78;
  t91 = t76 * mEE * t56;
  t94 = t89 - t91 - 0.3576408000e-2 * t59 - 0.3576408000e-2 * t60;
  t100 = t11 * t86 - t14 * t94 + 0.2040184800e-1 * t50 + 0.2040184800e-1 * t51 - 0.1629933080e0 * t63 + 0.1629933080e0 * t64;
  t102 = t58 * t72;
  t103 = t13 * t80;
  t104 = 0.4439138000e-2 * t59;
  t105 = 0.4439138000e-2 * t60;
  t108 = t102 + t103 + t104 + t105 - 0.1629933080e0 * t42 - 0.1629933080e0 * t47;
  t114 = 0.1943000000e0 + mEE;
  t115 = t13 * t114;
  t117 = t58 * t114;
  t121 = t115 * t76 - t117 * t67 + 0.156860000000000000e1 * t59 + 0.156860000000000000e1 * t60;
  t126 = t114 * t54 - 0.1568600000e1 * t49 + 0.156860000000000000e1 * t53;
  t130 = t11 * t121 - t14 * t126 + 0.130279999999999996e1 * t42 + 0.130279999999999996e1 * t47;
  t131 = t43 * t130;
  t137 = t117 * t76 + t115 * t67 - 0.2871400000e1 * t63 + 0.2871400000e1 * t64;
  t138 = t9 * t137;
  t140 = t9 * t100 - t43 * t108 + 0.2640085140e0 * t44 + 0.2640085140e0 * t45 + 0.3820582500e-1 * t50 + 0.3820582500e-1 * t51 - 0.3900000000e0 * t131 - 0.3900000000e0 * t138;
  t142 = t14 * t86;
  t143 = t11 * t94;
  t144 = 0.2040184800e-1 * t42;
  t145 = 0.2040184800e-1 * t47;
  t148 = -t142 - t143 + t144 + t145 + 0.3820582500e-1 * t35 - 0.3820582500e-1 * t40;
  t154 = t7 * t140 - t36 * t148 + 0.4130887200e-1 * t37 - 0.4130887200e-1 * t38 - 0.1680012540e0 * t44 - 0.1680012540e0 * t45;
  t156 = t43 * t100;
  t157 = t9 * t108;
  t158 = 0.2640085140e0 * t35;
  t159 = 0.2640085140e0 * t40;
  t160 = t9 * t130;
  t161 = 0.390000000000000014e0 * t160;
  t162 = t43 * t137;
  t163 = 0.3900000000e0 * t162;
  t166 = t156 + t157 + t158 - t159 + t161 - t163 - 0.1680012540e0 * t28 + 0.1680012540e0 * t33;
  t184 = t7 * (t160 - t162 + 0.250530000000000008e1 * t35 - 0.2505300000e1 * t40) - t36 * (-t14 * t121 - t11 * t126 - 0.3808100000e1 * t50 - 0.3808100000e1 * t51) + 0.253739999999999988e1 * t28 - 0.2537400000e1 * t33;
  t189 = t131 + t138 - 0.5042700000e1 * t44 - 0.5042700000e1 * t45;
  t194 = t36 * t140;
  t195 = t7 * t148;
  t196 = 0.4130887200e-1 * t28;
  t197 = 0.4130887200e-1 * t33;
  A(1) = t3 * (t5 * t154 - t29 * t166 + 0.3005390000e0 * t30 - 0.3005390000e0 * t31 + 0.3821100000e-1 * t37 - 0.3821100000e-1 * t38 - 0.4000000000e0 * t29 * t184 - 0.4000000000e0 * t5 * t189) + t15 * (-t194 - t195 + t196 - t197 + 0.3821100000e-1 * t24 + 0.3821100000e-1 * t26) - 0.4598523600e-1 * t19 - 0.4598523600e-1 * t22;
  A(2) = -t29 * t154 - t5 * t166 - 0.3005390000e0 * t24 - 0.3005390000e0 * t26 - 0.4000000000e0 * t5 * t184 + 0.400000000000000022e0 * t29 * t189;
  A(3) = -t194 - t195 + t196 - t197;
  A(4) = t156 + t157 + t158 - t159 + t161 - t163;
  A(5) = t142 + t143 - t144 - t145;
  A(6) = -t102 - t103 - t104 - t105;
  A(7) = t89 - t91;
  lbrGravitationalTorquesreturn = A;
