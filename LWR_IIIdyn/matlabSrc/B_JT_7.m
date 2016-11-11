function lbrBodyJacobian7_return = lbrBodyJacobian7_(q)
  A = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0;];
  t3 = q(2);
  t4 = sin(t3);
  t5 = q(7);
  t6 = sin(t5);
  t7 = t4 * t6;
  t8 = q(5);
  t9 = cos(t8);
  t10 = q(3);
  t11 = cos(t10);
  t12 = t9 * t11;
  t15 = sin(t10);
  t16 = cos(t5);
  t17 = t15 * t16;
  t18 = q(6);
  t19 = cos(t18);
  t20 = t19 * t9;
  t21 = t20 * t4;
  t24 = q(4);
  t25 = sin(t24);
  t26 = cos(t3);
  t27 = t25 * t26;
  t28 = t9 * t6;
  t31 = t16 * t4;
  t33 = cos(t24);
  t34 = t9 * t33;
  t35 = t34 * t15;
  t38 = t16 * t19;
  t39 = sin(t8);
  t40 = t38 * t39;
  t43 = t6 * t15;
  t44 = t39 * t4;
  t47 = t19 * t39;
  t48 = t47 * t11;
  t51 = sin(t18);
  t52 = t51 * t25;
  t53 = t52 * t15;
  t56 = t4 * t33;
  t57 = t11 * t28;
  t63 = t33 * t39;
  t64 = t63 * t15;
  A(1,1) = -0.4000000000e0 * t7 * t12 - 0.3900000000e0 * t21 * t17 + 0.3900000000e0 * t27 * t28 - 0.4000000000e0 * t31 * t19 * t35 + 0.3900000000e0 * t27 * t40 + 0.3900000000e0 * t44 * t43 - 0.4000000000e0 * t31 * t48 - 0.4000000000e0 * t31 * t53 - 0.3900000000e0 * t56 * t57 - 0.3900000000e0 * t56 * t16 * t48 + 0.4000000000e0 * t7 * t64;
  t69 = t9 * t16;
  t81 = t69 * t11;
  t86 = t19 * t6;
  t87 = t86 * t39;
  A(1,2) = 0.3900000000e0 * t17 * t44 + 0.3900000000e0 * t27 * t69 + 0.3900000000e0 * t43 * t21 + 0.4000000000e0 * t31 * t64 + 0.3900000000e0 * t56 * t6 * t48 - 0.4000000000e0 * t12 * t31 - 0.3900000000e0 * t56 * t81 + 0.4000000000e0 * t48 * t7 - 0.3900000000e0 * t27 * t87 + 0.4000000000e0 * t7 * t19 * t35 + 0.4000000000e0 * t7 * t53;
  t95 = t51 * t39;
  t96 = t4 * t11;
  t97 = t96 * t33;
  t101 = t9 * t15;
  t108 = t4 * t15;
  t109 = t25 * t19;
  t112 = t9 * t51;
  A(1,3) = 0.3900000000e0 * t97 * t95 + 0.3900000000e0 * t51 * t4 * t101 - 0.3900000000e0 * t95 * t27 + 0.4000000000e0 * t95 * t96 - 0.4000000000e0 * t108 * t109 + 0.4000000000e0 * t112 * t108 * t33;
  t116 = t38 * t9;
  t119 = t9 * t26 * t25;
  t121 = t108 * t39;
  t123 = t16 * t51;
  t124 = t25 * t96;
  t126 = t26 * t33;
  t128 = t6 * t39;
  t131 = t9 * t4;
  A(1,4) = t97 * t116 - t38 * t119 - t121 * t38 + t123 * t124 + t123 * t126 - t97 * t128 + t128 * t27 - t43 * t131;
  t133 = t86 * t9;
  t137 = t6 * t51;
  t140 = t16 * t39;
  A(1,5) = -t97 * t133 + t86 * t119 + t121 * t86 - t137 * t124 - t137 * t126 - t140 * t97 + t27 * t140 - t17 * t131;
  t148 = t11 * t25;
  A(1,6) = t19 * t26 * t33 - t112 * t97 + t19 * t4 * t148 + t95 * t108 + t112 * t27;
  t154 = t6 * t11;
  t157 = t39 * t15;
  t160 = t33 * t16;
  t162 = t19 * t15 * t39;
  t165 = t33 * t6;
  t168 = t12 * t33;
  t171 = t16 * t11;
  t174 = t11 * t33;
  A(2,1) = -0.4000000000e0 * t123 * t148 + 0.3900000000e0 * t154 * t39 + 0.4000000000e0 * t157 * t38 + 0.3900000000e0 * t160 * t162 + 0.3900000000e0 * t165 * t101 - 0.4000000000e0 * t38 * t168 - 0.3900000000e0 * t171 * t20 + 0.4000000000e0 * t128 * t174 + 0.4000000000e0 * t15 * t28;
  A(2,2) = -0.4000000000e0 * t86 * t157 + 0.4000000000e0 * t137 * t148 + 0.4000000000e0 * t86 * t168 + 0.4000000000e0 * t140 * t174 + 0.3900000000e0 * t171 * t39 + 0.3900000000e0 * t160 * t101 + 0.3900000000e0 * t154 * t20 - 0.3900000000e0 * t165 * t162 + 0.4000000000e0 * t69 * t15;
  t199 = t33 * t15;
  A(2,3) = -0.4000000000e0 * t148 * t19 - 0.3900000000e0 * t95 * t199 - 0.4000000000e0 * t95 * t15 + 0.4000000000e0 * t112 * t174 + 0.3900000000e0 * t112 * t11;
  t209 = t39 * t11;
  t211 = t15 * t25;
  A(2,4) = -t35 * t38 - t209 * t38 - t211 * t123 + t128 * t199 - t57;
  A(2,5) = t209 * t86 + t86 * t35 - t81 + t137 * t211 + t140 * t199;
  A(2,6) = t112 * t199 + t11 * t95 - t211 * t19;
  t222 = q(1);
  t223 = cos(t222);
  t224 = t223 * t26;
  t225 = t16 * t224;
  t226 = sin(t222);
  t228 = t20 * t33 * t226;
  t231 = t226 * t11;
  t232 = t231 * t16;
  t234 = t51 * t223 * t56;
  t237 = t11 ^ 2;
  t238 = t226 * t237;
  t239 = t238 * t6;
  t240 = t63 * t224;
  t243 = t231 * t6;
  t245 = t4 * t25;
  t246 = t39 * t223 * t245;
  t249 = t224 * t15;
  t253 = t238 * t16;
  t254 = t52 * t224;
  t259 = t47 * t231;
  t263 = t224 * t34;
  t268 = t9 * t223 * t245;
  t271 = t52 * t226;
  t274 = t224 * t6;
  t275 = t63 * t226;
  t278 = 0.1950000000e18 * t28 + 0.7e1 * t225 * t228 + 0.7e1 * t232 * t234 + 0.14e2 * t239 * t240 + 0.7e1 * t243 * t246 + 0.14e2 * t249 * t28 * t231 - 0.14e2 * t253 * t254 + 0.1950000000e18 * t40 + 0.14e2 * t224 * t17 * t259 - 0.14e2 * t238 * t38 * t263 - 0.7e1 * t231 * t38 * t268 + 0.7e1 * t225 * t271 - 0.7e1 * t274 * t275;
  A(3,1) = 0.2000000000e-17 * t25 * t278;
  t308 = -0.1950000000e18 * t69 + 0.7e1 * t271 * t274 + 0.7e1 * t225 * t275 + 0.7e1 * t274 * t228 - 0.14e2 * t249 * t69 * t231 - 0.14e2 * t239 * t254 + 0.7e1 * t243 * t234 - 0.14e2 * t240 * t253 - 0.7e1 * t232 * t246 + 0.1950000000e18 * t87 + 0.14e2 * t224 * t43 * t259 - 0.14e2 * t238 * t86 * t263 - 0.7e1 * t231 * t86 * t268;
  A(3,2) = -0.2000000000e-17 * t25 * t308;
  A(3,3) = -0.2000000000e-17 * t25 * (0.1950000000e18 * t95 + 0.14e2 * t249 * t95 * t231 - 0.14e2 * t238 * t51 * t263 - 0.7e1 * t231 * t51 * t268 - 0.7e1 * t224 * t109 * t226 + 0.14e2 * t238 * t19 * t25 * t223 * t26 - 0.7e1 * t231 * t19 * t223 * t4 * t33 + 0.7e1 * t224 * t51 * t34 * t226);
  t342 = t25 * t9;
  A(3,4) = t123 * t33 - t38 * t342 + t128 * t25;
  A(3,5) = t86 * t342 - t137 * t33 + t140 * t25;
  A(3,6) = t25 * t112 + t19 * t33;
  A(4,1) = 0.3900000000e0 * t116 - 0.3900000000e0 * t128;
  A(4,2) = -0.3900000000e0 * t140 - 0.3900000000e0 * t133;
  A(4,3) = -0.3900000000e0 * t112;
  A(4,4) = t28 + t40;
  A(4,5) = -t87 + t69;
  A(4,6) = -t95;
  A(5,1) = 0.0e0;
  A(5,2) = 0.0e0;
  A(5,3) = 0.0e0;
  A(5,4) = t123;
  A(5,5) = -t137;
  A(5,6) = t19;
  A(6,1) = 0.0e0;
  A(6,2) = 0.0e0;
  A(6,3) = 0.0e0;
  A(6,4) = -t6;
  A(6,5) = -t16;
  A(6,6) = 0.0e0;
  A(7,1) = 0.0e0;
  A(7,2) = 0.0e0;
  A(7,3) = 0.0e0;
  A(7,4) = 0.0e0;
  A(7,5) = 0.0e0;
  A(7,6) = 0.1e1;
  lbrBodyJacobian7_return = A;
