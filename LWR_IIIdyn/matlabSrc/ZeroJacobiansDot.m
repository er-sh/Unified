function lbrZeroJacobiansDotreturn = lbrZeroJacobiansDot(q, qd)
  A = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
  A(1,1) = 0.0e0;
  A(1,2) = 0.0e0;
  A(1,3) = 0.0e0;
  A(1,4) = 0.0e0;
  A(1,5) = 0.0e0;
  A(1,6) = 0.0e0;
  A(1,7) = 0.0e0;
  A(1,8) = 0.0e0;
  A(1,9) = 0.0e0;
  A(1,10) = 0.0e0;
  A(1,11) = 0.0e0;
  A(1,12) = 0.0e0;
  t3 = q(1);
  t4 = cos(t3);
  t5 = qd(1);
  t6 = t4 * t5;
  t7 = q(2);
  t8 = sin(t7);
  t9 = t6 * t8;
  t11 = sin(t3);
  t12 = cos(t7);
  t13 = t11 * t12;
  t14 = qd(2);
  t15 = t13 * t14;
  A(1,13) = t9 * 0.400000000000000022e0 + t15 * 0.400000000000000022e0;
  t17 = t11 * t5;
  t18 = t17 * t8;
  t20 = t4 * t12;
  t21 = t20 * t14;
  A(1,14) = t18 * 0.400000000000000022e0 + t21 * (-0.400000000000000022e0);
  A(1,15) = 0.0e0;
  A(1,16) = 0.0e0;
  A(1,17) = 0.0e0;
  A(1,18) = 0.0e0;
  A(1,19) = A(1,13);
  A(1,20) = A(1,14);
  A(1,21) = 0.0e0;
  A(1,22) = 0.0e0;
  A(1,23) = 0.0e0;
  A(1,24) = 0.0e0;
  t23 = qd(4);
  t24 = q(4);
  t25 = cos(t24);
  t26 = t23 * t25;
  t27 = q(3);
  t28 = cos(t27);
  t29 = t13 * t28;
  t30 = t29 * t26;
  t32 = sin(t24);
  t33 = t5 * t32;
  t34 = t20 * t28;
  t35 = t33 * t34;
  t37 = t11 * t14;
  t38 = t8 * t28;
  t39 = t38 * t32;
  t40 = t37 * t39;
  t42 = qd(3);
  t43 = t42 * t32;
  t44 = sin(t27);
  t45 = t44 * t13;
  t46 = t43 * t45;
  t48 = t4 * t44;
  t49 = t48 * t26;
  t51 = t44 * t11;
  t52 = t33 * t51;
  t54 = t4 * t28;
  t55 = t43 * t54;
  t57 = t8 * t25;
  t58 = t6 * t57;
  t60 = t12 * t25;
  t61 = t37 * t60;
  t63 = t23 * t11;
  t64 = t8 * t32;
  t65 = t63 * t64;
  A(1,25) = -0.3900000000e0 * t30 - 0.3900000000e0 * t35 + 0.3900000000e0 * t40 + 0.3900000000e0 * t46 - 0.3900000000e0 * t49 + 0.3900000000e0 * t52 - 0.3900000000e0 * t55 + 0.3900000000e0 * t58 + 0.3900000000e0 * t61 - 0.3900000000e0 * t65 + 0.4000000000e0 * t9 + 0.4000000000e0 * t15;
  t69 = t34 * t26;
  t71 = t33 * t29;
  t73 = t4 * t14;
  t74 = t73 * t39;
  t76 = t20 * t44;
  t77 = t43 * t76;
  t79 = t51 * t26;
  t81 = t33 * t48;
  t83 = t28 * t11;
  t84 = t43 * t83;
  t86 = t17 * t57;
  t88 = t73 * t60;
  t90 = t23 * t4;
  t91 = t90 * t64;
  A(1,26) = 0.3900000000e0 * t69 - 0.3900000000e0 * t71 - 0.3900000000e0 * t74 - 0.3900000000e0 * t77 - 0.3900000000e0 * t79 - 0.3900000000e0 * t81 - 0.3900000000e0 * t84 + 0.3900000000e0 * t86 - 0.3900000000e0 * t88 + 0.3900000000e0 * t91 + 0.4000000000e0 * t18 - 0.4000000000e0 * t21;
  A(1,27) = 0.0e0;
  A(1,28) = 0.0e0;
  A(1,29) = 0.0e0;
  A(1,30) = 0.0e0;
  A(1,31) = A(1,25);
  A(1,32) = A(1,26);
  A(1,33) = 0.0e0;
  A(1,34) = 0.0e0;
  A(1,35) = 0.0e0;
  A(1,36) = 0.0e0;
  A(1,37) = A(1,31);
  A(1,38) = A(1,32);
  A(1,39) = 0.0e0;
  A(1,40) = 0.0e0;
  A(1,41) = 0.0e0;
  A(1,42) = 0.0e0;
  A(2,1) = 0.0e0;
  A(2,2) = 0.0e0;
  A(2,3) = 0.0e0;
  A(2,4) = 0.0e0;
  A(2,5) = 0.0e0;
  A(2,6) = 0.0e0;
  A(2,7) = 0.0e0;
  A(2,8) = 0.0e0;
  A(2,9) = 0.0e0;
  A(2,10) = t6;
  A(2,11) = t17;
  A(2,12) = 0.0e0;
  t97 = t4 * t8;
  A(2,13) = t13 * t5 * 0.400000000000000022e0 + t97 * t14 * 0.400000000000000022e0;
  t102 = t8 * t11;
  A(2,14) = t20 * t5 * (-0.400000000000000022e0) + t102 * t14 * 0.400000000000000022e0;
  t105 = t12 * t14;
  A(2,15) = t105 * (-0.400000000000000022e0);
  A(2,16) = A(2,10);
  A(2,17) = A(2,11);
  A(2,18) = 0.0e0;
  A(2,19) = A(2,13);
  A(2,20) = A(2,14);
  A(2,21) = A(2,15);
  A(2,22) = A(2,16);
  A(2,23) = A(2,17);
  A(2,24) = 0.0e0;
  t110 = 0.39e2 * t39 + 0.39e2 * t60 + 0.40e2 * t12;
  t113 = t28 * t32;
  t114 = t105 * t113;
  t116 = t8 * t42;
  t117 = t44 * t32;
  t118 = t116 * t117;
  t120 = t23 * t8;
  t121 = t28 * t25;
  t122 = t120 * t121;
  t124 = t14 * t8;
  t125 = t124 * t25;
  t127 = t23 * t12;
  t128 = t127 * t32;
  t131 = 0.39e2 * t114 - 0.39e2 * t118 + 0.39e2 * t122 - 0.39e2 * t125 - 0.39e2 * t128 - 0.40e2 * t124;
  A(2,25) = 0.1000000000e-1 * t17 * t110 - 0.1000000000e-1 * t4 * t131;
  A(2,26) = -0.1000000000e-1 * t6 * t110 - 0.1000000000e-1 * t11 * t131;
  t145 = t105 * t25;
  t147 = t120 * t32;
  A(2,27) = -0.3900000000e0 * t124 * t113 - 0.3900000000e0 * t12 * t42 * t117 + 0.3900000000e0 * t121 * t127 - 0.3900000000e0 * t145 + 0.3900000000e0 * t147 - 0.4000000000e0 * t105;
  A(2,28) = A(2,22);
  A(2,29) = A(2,23);
  A(2,30) = 0.0e0;
  A(2,31) = A(2,25);
  A(2,32) = A(2,26);
  A(2,33) = A(2,27);
  A(2,34) = A(2,28);
  A(2,35) = A(2,29);
  A(2,36) = 0.0e0;
  A(2,37) = A(2,31);
  A(2,38) = A(2,32);
  A(2,39) = A(2,33);
  A(2,40) = A(2,34);
  A(2,41) = A(2,35);
  A(2,42) = 0.0e0;
  A(3,1) = 0.0e0;
  A(3,2) = 0.0e0;
  A(3,3) = 0.0e0;
  A(3,4) = 0.0e0;
  A(3,5) = 0.0e0;
  A(3,6) = 0.0e0;
  A(3,7) = 0.0e0;
  A(3,8) = 0.0e0;
  A(3,9) = 0.0e0;
  A(3,10) = 0.0e0;
  A(3,11) = 0.0e0;
  A(3,12) = 0.0e0;
  A(3,13) = 0.0e0;
  A(3,14) = 0.0e0;
  A(3,15) = 0.0e0;
  A(3,16) = t18 - t21;
  A(3,17) = -t9 - t15;
  A(3,18) = -t124;
  A(3,19) = 0.0e0;
  A(3,20) = 0.0e0;
  A(3,21) = 0.0e0;
  A(3,22) = A(3,16);
  A(3,23) = A(3,17);
  A(3,24) = A(3,18);
  t150 = t12 * t44;
  t152 = t8 * t44;
  t154 = t42 * t4;
  t155 = t12 * t28;
  t157 = t6 * t28;
  t158 = t42 * t11;
  t159 = t158 * t44;
  t160 = -A(2,41) * t150 - t73 * t152 + t154 * t155 + t157 - t159;
  A(3,25) = t32 * t160 * (-0.390000000000000014e0) + (t76 + t83) * t25 * t23 * (-0.390000000000000014e0);
  t167 = A(2,40) * t150;
  t168 = t37 * t152;
  t169 = t158 * t155;
  t170 = t17 * t28;
  t172 = t154 * t44;
  A(3,26) = -0.3900000000e0 * (t167 - t168 + t169 + 0.1e1 * t170 + 0.1e1 * t172) * t32 - 0.3900000000e0 * (t45 - 0.1e1 * t54) * t25 * t23;
  t186 = t44 * t25;
  A(3,27) = t105 * t117 * (-0.390000000000000014e0) + t116 * t113 * (-0.390000000000000014e0) + t120 * t186 * (-0.390000000000000014e0);
  A(3,28) = A(3,22);
  A(3,29) = A(3,23);
  A(3,30) = A(3,24);
  A(3,31) = A(3,25);
  A(3,32) = A(3,26);
  A(3,33) = A(3,27);
  A(3,34) = A(3,28);
  A(3,35) = A(3,29);
  A(3,36) = A(3,30);
  A(3,37) = A(3,31);
  A(3,38) = A(3,32);
  A(3,39) = A(3,33);
  A(3,40) = A(3,34);
  A(3,41) = A(3,35);
  A(3,42) = A(3,36);
  A(4,1) = 0.0e0;
  A(4,2) = 0.0e0;
  A(4,3) = 0.0e0;
  A(4,4) = 0.0e0;
  A(4,5) = 0.0e0;
  A(4,6) = 0.0e0;
  A(4,7) = 0.0e0;
  A(4,8) = 0.0e0;
  A(4,9) = 0.0e0;
  A(4,10) = 0.0e0;
  A(4,11) = 0.0e0;
  A(4,12) = 0.0e0;
  A(4,13) = 0.0e0;
  A(4,14) = 0.0e0;
  A(4,15) = 0.0e0;
  A(4,16) = 0.0e0;
  A(4,17) = 0.0e0;
  A(4,18) = 0.0e0;
  A(4,19) = 0.0e0;
  A(4,20) = 0.0e0;
  A(4,21) = 0.0e0;
  A(4,22) = -t160;
  A(4,23) = -t167 + t168 - t169 - t170 - t172;
  t189 = t105 * t44;
  t190 = t42 * t38;
  A(4,24) = -t189 - t190;
  t191 = t23 * t32;
  t194 = t5 * t25;
  t197 = t38 * t25;
  t200 = t25 * t42;
  t211 = t32 * t12;
  A(4,25) = -0.3900000000e0 * t191 * t34 - 0.3900000000e0 * t194 * t29 - 0.3900000000e0 * t73 * t197 - 0.3900000000e0 * t76 * t200 + 0.3900000000e0 * t191 * t51 - 0.3900000000e0 * t194 * t48 - 0.3900000000e0 * t83 * t200 - 0.3900000000e0 * A(2,41) * t64 + 0.3900000000e0 * t73 * t211 + 0.3900000000e0 * t90 * t57;
  A(4,26) = -0.3900000000e0 * t191 * t29 + 0.3900000000e0 * t194 * t34 - 0.3900000000e0 * t37 * t197 - 0.3900000000e0 * t200 * t45 - 0.3900000000e0 * t191 * t48 - 0.3900000000e0 * t194 * t51 + 0.3900000000e0 * t54 * t200 + 0.3900000000e0 * A(2,40) * t64 + 0.3900000000e0 * t37 * t211 + 0.3900000000e0 * t63 * t57;
  t242 = t124 * t32;
  t244 = t127 * t25;
  A(4,27) = 0.3900000000e0 * t105 * t121 - 0.3900000000e0 * t116 * t186 - 0.3900000000e0 * t120 * t113 + 0.3900000000e0 * t242 - 0.3900000000e0 * t244;
  A(4,28) = A(4,22);
  A(4,29) = A(4,23);
  A(4,30) = A(4,24);
  A(4,31) = A(4,25);
  A(4,32) = A(4,26);
  A(4,33) = A(4,27);
  A(4,34) = A(4,28);
  A(4,35) = A(4,29);
  A(4,36) = A(4,30);
  A(4,37) = A(4,31);
  A(4,38) = A(4,32);
  A(4,39) = A(4,33);
  A(4,40) = A(4,34);
  A(4,41) = A(4,35);
  A(4,42) = A(4,36);
  A(5,1) = 0.0e0;
  A(5,2) = 0.0e0;
  A(5,3) = 0.0e0;
  A(5,4) = 0.0e0;
  A(5,5) = 0.0e0;
  A(5,6) = 0.0e0;
  A(5,7) = 0.0e0;
  A(5,8) = 0.0e0;
  A(5,9) = 0.0e0;
  A(5,10) = 0.0e0;
  A(5,11) = 0.0e0;
  A(5,12) = 0.0e0;
  A(5,13) = 0.0e0;
  A(5,14) = 0.0e0;
  A(5,15) = 0.0e0;
  A(5,16) = 0.0e0;
  A(5,17) = 0.0e0;
  A(5,18) = 0.0e0;
  A(5,19) = 0.0e0;
  A(5,20) = 0.0e0;
  A(5,21) = 0.0e0;
  A(5,22) = 0.0e0;
  A(5,23) = 0.0e0;
  A(5,24) = 0.0e0;
  A(5,25) = 0.0e0;
  A(5,26) = 0.0e0;
  A(5,27) = 0.0e0;
  A(5,28) = t86 - t88 + t91 - t79 - t81 - t84 + t69 - t71 - t74 - t77;
  A(5,29) = -t58 - t61 + t65 + t49 - t52 + t55 + t30 + t35 - t40 - t46;
  A(5,30) = t114 - t118 + t122 - t125 - t128;
  A(5,31) = 0.0e0;
  A(5,32) = 0.0e0;
  A(5,33) = 0.0e0;
  A(5,34) = A(5,28);
  A(5,35) = A(5,29);
  A(5,36) = A(5,30);
  A(5,37) = 0.0e0;
  A(5,38) = 0.0e0;
  A(5,39) = 0.0e0;
  A(5,40) = A(5,34);
  A(5,41) = A(5,35);
  A(5,42) = A(5,36);
  A(6,1) = 0.0e0;
  A(6,2) = 0.0e0;
  A(6,3) = 0.0e0;
  A(6,4) = 0.0e0;
  A(6,5) = 0.0e0;
  A(6,6) = 0.0e0;
  A(6,7) = 0.0e0;
  A(6,8) = 0.0e0;
  A(6,9) = 0.0e0;
  A(6,10) = 0.0e0;
  A(6,11) = 0.0e0;
  A(6,12) = 0.0e0;
  A(6,13) = 0.0e0;
  A(6,14) = 0.0e0;
  A(6,15) = 0.0e0;
  A(6,16) = 0.0e0;
  A(6,17) = 0.0e0;
  A(6,18) = 0.0e0;
  A(6,19) = 0.0e0;
  A(6,20) = 0.0e0;
  A(6,21) = 0.0e0;
  A(6,22) = 0.0e0;
  A(6,23) = 0.0e0;
  A(6,24) = 0.0e0;
  A(6,25) = 0.0e0;
  A(6,26) = 0.0e0;
  A(6,27) = 0.0e0;
  A(6,28) = 0.0e0;
  A(6,29) = 0.0e0;
  A(6,30) = 0.0e0;
  A(6,31) = 0.0e0;
  A(6,32) = 0.0e0;
  A(6,33) = 0.0e0;
  t246 = q(5);
  t247 = cos(t246);
  t248 = qd(5);
  t249 = t247 * t248;
  t250 = t25 * t11;
  t251 = t250 * t44;
  t253 = sin(t246);
  t254 = t253 * t32;
  t255 = t63 * t44;
  t257 = t253 * t25;
  t258 = t6 * t44;
  t260 = t83 * t42;
  t262 = t253 * t248;
  t264 = t247 * t4;
  t265 = t5 * t28;
  t267 = t247 * t11;
  t268 = t44 * t42;
  t270 = t249 * t25;
  t272 = t23 * t254;
  t274 = t257 * t11;
  t275 = t5 * t12;
  t276 = t275 * t28;
  t278 = t257 * t4;
  t279 = t28 * t124;
  t281 = t150 * t42;
  t284 = t275 * t44;
  t286 = t124 * t44;
  t288 = t155 * t42;
  t290 = t97 * t32;
  t292 = t253 * t11;
  t293 = t5 * t8;
  t294 = t293 * t32;
  t296 = t4 * t253;
  t297 = t105 * t32;
  t299 = t23 * t57;
  A(6,34) = -t249 * t251 + t254 * t255 - t257 * t258 - t257 * t260 - t262 * t83 + t264 * t265 - t267 * t268 + t270 * t34 - t272 * t34 - t274 * t276 - t278 * t279 - t278 * t281 - t262 * t76 - t267 * t284 - t264 * t286 + t288 * t264 + t249 * t290 - t292 * t294 + t296 * t297 + t296 * t299;
  t305 = t102 * t32;
  t310 = t4 * t25;
  t311 = t310 * t44;
  t313 = t90 * t44;
  t315 = t17 * t44;
  t317 = t54 * t42;
  A(6,35) = -t262 * t45 + t264 * t284 - t267 * t286 + t267 * t288 + t249 * t305 + t296 * t294 + t292 * t297 + t292 * t299 + t249 * t311 - t254 * t313 - t257 * t315 + t257 * t317 + t270 * t29 - t272 * t29 + t278 * t276 - t274 * t279 - t274 * t281 + t262 * t54 + t267 * t265 + t264 * t268;
  t328 = t253 * t8;
  t331 = t253 * t12;
  t339 = t14 * t28;
  t340 = t339 * t25;
  t342 = t268 * t25;
  t344 = t113 * t23;
  A(6,36) = -t249 * t211 + t328 * t14 * t32 - t331 * t26 + t105 * t44 * t247 + t38 * t42 * t247 - t152 * t262 + t249 * t197 + t340 * t331 - t328 * t342 - t328 * t344;
  A(6,37) = 0.0e0;
  A(6,38) = 0.0e0;
  A(6,39) = 0.0e0;
  A(6,40) = A(6,34);
  A(6,41) = A(6,35);
  A(6,42) = A(6,36);
  A(7,1) = 0.0e0;
  A(7,2) = 0.0e0;
  A(7,3) = 0.0e0;
  A(7,4) = 0.0e0;
  A(7,5) = 0.0e0;
  A(7,6) = 0.0e0;
  A(7,7) = 0.0e0;
  A(7,8) = 0.0e0;
  A(7,9) = 0.0e0;
  A(7,10) = 0.0e0;
  A(7,11) = 0.0e0;
  A(7,12) = 0.0e0;
  A(7,13) = 0.0e0;
  A(7,14) = 0.0e0;
  A(7,15) = 0.0e0;
  A(7,16) = 0.0e0;
  A(7,17) = 0.0e0;
  A(7,18) = 0.0e0;
  A(7,19) = 0.0e0;
  A(7,20) = 0.0e0;
  A(7,21) = 0.0e0;
  A(7,22) = 0.0e0;
  A(7,23) = 0.0e0;
  A(7,24) = 0.0e0;
  A(7,25) = 0.0e0;
  A(7,26) = 0.0e0;
  A(7,27) = 0.0e0;
  A(7,28) = 0.0e0;
  A(7,29) = 0.0e0;
  A(7,30) = 0.0e0;
  A(7,31) = 0.0e0;
  A(7,32) = 0.0e0;
  A(7,33) = 0.0e0;
  A(7,34) = 0.0e0;
  A(7,35) = 0.0e0;
  A(7,36) = 0.0e0;
  A(7,37) = 0.0e0;
  A(7,38) = 0.0e0;
  A(7,39) = 0.0e0;
  t346 = q(6);
  t347 = sin(t346);
  t348 = t347 * t247;
  t349 = t348 * t25;
  t354 = t348 * t32;
  t359 = cos(t346);
  t360 = qd(6);
  t361 = t359 * t360;
  t362 = t361 * t247;
  t363 = t310 * t155;
  t365 = t347 * t253;
  t366 = t365 * t248;
  t368 = t359 * t11;
  t369 = t293 * t25;
  t371 = t359 * t32;
  t374 = t347 * t360;
  t385 = t359 * t4;
  t387 = t359 * t25;
  t393 = t349 * t97 * t339 + t349 * A(2,41) * t155 + t354 * t90 * t155 + t349 * t20 * t268 - t362 * t363 + t366 * t363 + t368 * t369 - t371 * t258 + t365 * t157 + t374 * t97 * t25 + t374 * t32 * t11 * t44 + t361 * t292 * t28 + t348 * t248 * t11 * t28 + t385 * t147 - t387 * t255 - t371 * t260 - t365 * t159 - t385 * t145 + t366 * t290;
  t394 = t348 * t248;
  t398 = t374 * t32;
  t400 = t361 * t253;
  t403 = t348 * t4;
  t405 = t387 * t23;
  t409 = t371 * t4;
  t411 = t365 * t4;
  t416 = t371 * t11;
  t418 = t365 * t11;
  t421 = t348 * t11;
  t423 = t394 * t76 - t366 * t251 - t362 * t290 - t398 * t34 + t400 * t76 + t362 * t251 - t403 * t299 + t405 * t34 - t354 * t255 - t403 * t297 - t409 * t279 - t411 * t286 - t409 * t281 + t411 * t288 + t349 * t260 - t416 * t276 - t418 * t284 + t349 * t258 + t421 * t294;
  A(7,40) = t393 + t423;
  t432 = t250 * t155;
  t454 = t354 * t63 * t155 + t349 * t13 * t268 + t349 * t102 * t339 - t349 * A(2,40) * t155 + t366 * t432 - t362 * t432 - t371 * t315 + t365 * t170 - t385 * t369 - t348 * t248 * t4 * t28 - t374 * t32 * t4 * t44 - t361 * t296 * t28 + t374 * t102 * t25 + t368 * t147 + t387 * t313 + t371 * t317 + t365 * t172 - t368 * t145 + t405 * t29;
  t474 = t354 * t313 + t366 * t305 + t394 * t45 + t366 * t311 - t349 * t317 - t416 * t281 + t418 * t288 + t349 * t315 - t403 * t294 + t409 * t276 + t411 * t284 - t421 * t297 - t416 * t279 - t418 * t286 - t362 * t311 - t362 * t305 - t398 * t29 + t400 * t45 - t421 * t299;
  A(7,41) = t454 + t474;
  t476 = t359 * t8;
  t479 = t359 * t12;
  t485 = t348 * t8;
  A(7,42) = -t374 * t60 - t476 * t14 * t25 - t479 * t191 - t362 * t197 + t366 * t197 - t348 * t12 * t340 + t485 * t342 + t485 * t344 - t374 * t39 + t479 * t339 * t32 - t476 * t268 * t32 + t476 * t121 * t23 + t361 * t328 * t44 + t348 * t248 * t8 * t44 + t365 * t189 + t365 * t190 + t361 * t247 * t12 * t32 - t365 * t248 * t12 * t32 - t348 * t242 + t348 * t244;
  lbrZeroJacobiansDotreturn = A;
