function lbrBodyJacobian2_return = lbrBodyJacobian2_(q)
  A = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0;];
  A(1,1) = 0.0e0;
  A(1,2) = 0.0e0;
  A(1,3) = 0.0e0;
  t3 = q(2);
  A(1,4) = sin(t3);
  A(1,5) = cos(t3);
  A(1,6) = 0.0e0;
  A(2,1) = 0.0e0;
  A(2,2) = 0.0e0;
  A(2,3) = 0.0e0;
  A(2,4) = 0.0e0;
  A(2,5) = 0.0e0;
  A(2,6) = 0.1e1;
  A(3,1) = 0.0e0;
  A(3,2) = 0.0e0;
  A(3,3) = 0.0e0;
  A(3,4) = 0.0e0;
  A(3,5) = 0.0e0;
  A(3,6) = 0.0e0;
  A(4,1) = 0.0e0;
  A(4,2) = 0.0e0;
  A(4,3) = 0.0e0;
  A(4,4) = 0.0e0;
  A(4,5) = 0.0e0;
  A(4,6) = 0.0e0;
  A(5,1) = 0.0e0;
  A(5,2) = 0.0e0;
  A(5,3) = 0.0e0;
  A(5,4) = 0.0e0;
  A(5,5) = 0.0e0;
  A(5,6) = 0.0e0;
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
  lbrBodyJacobian2_return = A;
