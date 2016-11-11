%% Transformations 1st Joint
disp(sprintf('\tTransformationmatrix 1st body'));
R0_1 = [cos(q1r) -sin(q1r) 0
        sin(q1r) cos(q1r)  0
        0       0        1];
x0_1 = [0; 0; 0.31];

T0_1 = [R0_1 x0_1
       0 0 0 1];

%% Transformations 2nd Joint
disp(sprintf('\tTransformationmatrix 2nd body'));
R1_2 = [1  0  0
        0  0  -1
        0  1 0]*...
       [cos(q2r) -sin(q2r) 0
        sin(q2r) cos(q2r)  0
       0       0        1];
x1_2 = [0; 0; 0];

T1_2 = [R1_2 x1_2
       0 0 0 1];

T0_2 = T0_1*T1_2;

%% Transformations 3rd Joint
disp(sprintf('\tTransformationmatrix 3rd body'));
R2_3 = [1  0  0
        0  0  1
        0  -1 0]*...
       [cos(q3r) -sin(q3r) 0
        sin(q3r) cos(q3r)  0
       0       0        1];
x2_3 = [0; 0.4; 0];

T2_3 = [R2_3 x2_3
       0 0 0 1];

T0_3 = T0_2*T2_3;

%% Transformations 4th Joint
disp(sprintf('\tTransformationmatrix 4th body'));
R3_4 = [1  0  0
        0  0  1
        0  -1 0]*...
       [cos(q4r) -sin(q4r) 0
        sin(q4r) cos(q4r)  0
       0       0        1];
x3_4 = [0; 0; 0];

T3_4 = [R3_4 x3_4
       0 0 0 1];

T0_4 = T0_3*T3_4;

%% Transformations 5th Joint
disp(sprintf('\tTransformationmatrix 5th body'));
R4_5 = [1  0  0
        0  0  -1
        0  1  0]*...
       [cos(q5r) -sin(q5r) 0
        sin(q5r) cos(q5r)  0
       0       0        1];
x4_5 = [0; -0.39; 0];

T4_5 = [R4_5 x4_5
       0 0 0 1];

T0_5 = T0_4*T4_5;

%% Transformations 6th Joint
disp(sprintf('\tTransformationmatrix 6th body'));
R5_6 = [1  0  0
        0  0  -1
        0  1  0]*...
       [cos(q6r) -sin(q6r) 0
        sin(q6r) cos(q6r)  0
       0       0        1];
x5_6 = [0; 0; 0];

T5_6 = [R5_6 x5_6
       0 0 0 1];

T0_6 = T0_5*T5_6;

%% Transformations 7th Joint
disp(sprintf('\tTransformationmatrix 7th body'));
R6_7 = [1  0  0
        0  0  1
        0  -1 0]*...
       [cos(q7r) -sin(q7r) 0
        sin(q7r) cos(q7r)  0
       0       0        1];
x6_7 = [0; 0; 0];

T6_7 = [R6_7 x6_7
       0 0 0 1];

T0_7 = T0_6*T6_7;

%% Transformations EE Joint
disp(sprintf('\tTransformationmatrix EE coordinate system'));
T0_EE = T0_7*T7_EE;

%% Kinematic 1st Body
disp(sprintf('\tKinematics 1st body'));
% trans position
r1 = T0_1*[rC1; 1];
r1 = r1(1:3);

% trans velocities
Jt1 = simple(jacobian(r1,qr)); %COM Jacobian
Jt1l = simple(jacobian(T0_1(1:3,4),qr)); %Link Jacobian
Jt1ld = subs(diff(subs(Jt1l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v1 = Jt1*qdr;

% trans acceleration
abar1 = jacobian(v1, qr)*qdr;
a1 = Jt1*qddr+abar1;

% rot velocities
omegaTilde1 = subs((diff(subs(R0_1,qr ,qt),t)*R0_1'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega1 = [omegaTilde1(3,2)
         omegaTilde1(1,3)
         omegaTilde1(2,1)];
omega1 = simple(omega1);
Jr1 = simple(jacobian(omega1,qdr));
Jr1d = subs(diff(subs(Jr1,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar1 = jacobian(omega1,qr)*qdr;
alpha1 = Jr1*qddr+alphabar1;

%clear omegaTilde1;

%% Kinematic 2nd Body
disp(sprintf('\tKinematics 2nd body'));
% trans position
r2 = T0_2*[rC2; 1];
r2 = r2(1:3);

% trans velocities
Jt2 = simple(jacobian(r2,qr)); %COM jacobian
Jt2l = simple(jacobian(T0_2(1:3,4),qr)); %Link jacobian
Jt2ld = subs(diff(subs(Jt2l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v2 = Jt2*qdr;

% trans acceleration
abar2 = simple(jacobian(v2, qr)*qdr);
a2 = simple(Jt2*qddr+abar2);

%Rot Matrix
R0_2 = T0_2(1:3,1:3);

% rot velocities
omegaTilde2 = subs((diff(subs(R0_2,qr ,qt),t)*R0_2'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega2 = [omegaTilde2(3,2)
         omegaTilde2(1,3)
         omegaTilde2(2,1)];
omega2 = simple(omega2);
Jr2 = simple(jacobian(omega2,qdr));
Jr2d = subs(diff(subs(Jr2,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar2 = jacobian(omega2,qr)*qdr;
alpha2 = Jr2*qddr+alphabar2;

clear omegaTilde2;

%% Kinematic 3rd Body
disp(sprintf('\tKinematics 3rd body'));
% trans position
r3 = T0_3*[rC3; 1];
r3 = r3(1:3);

% trans velocities
Jt3 = simple(jacobian(r3,qr)); %COM jacobian
Jt3l = simple(jacobian(T0_3(1:3,4),qr)); %Link jacobian
Jt3ld = subs(diff(subs(Jt3l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v3 = simple(Jt3*qdr);

% trans acceleration
abar3 = jacobian(v3, qr)*qdr;
a3 = simple(Jt3*qddr+abar3);

%Rot Matrix
R0_3 = T0_3(1:3,1:3);

% rot velocities
omegaTilde3 = subs((diff(subs(R0_3,qr ,qt),t)*R0_3'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega3 = [omegaTilde3(3,2)
         omegaTilde3(1,3)
         omegaTilde3(2,1)];
omega3 = simple(omega3);
Jr3 = simple(jacobian(omega3,qdr));
Jr3d = subs(diff(subs(Jr3,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar3 = jacobian(omega3,qr)*qdr;
alpha3 = Jr3*qddr+alphabar3;

clear omegaTilde3;

%% Kinematic 4th Body
disp(sprintf('\tKinematics 4th body'));
% trans position
r4 = T0_4*[rC4; 1];
r4 = r4(1:3);

% trans velocities
Jt4 = simple(jacobian(r4,qr)); % COM jacobian
Jt4l = simple(jacobian(T0_4(1:3,4),qr)); %Link jacobian
Jt4ld = subs(diff(subs(Jt4l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v4 = simple(Jt4*qdr);

% trans acceleration
abar4 = jacobian(v4, qr)*qdr;
a4 = Jt4*qddr+abar4;

%Rot Matrix
R0_4 = T0_4(1:3,1:3);

% rot velocities
omegaTilde4 = subs((diff(subs(R0_4,qr ,qt),t)*R0_4'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega4 = [omegaTilde4(3,2)
         omegaTilde4(1,3)
         omegaTilde4(2,1)];
omega4 = simple(omega4);
Jr4 = simple(jacobian(omega4,qdr));
Jr4d = subs(diff(subs(Jr4,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar4 = jacobian(omega4,qr)*qdr;
alpha4 = Jr4*qddr+alphabar4;

clear omegaTilde4;


%% Kinematic 5th Body
disp(sprintf('\tKinematics 5th body'));
% trans position
r5 = T0_5*[rC5; 1];
r5 = r5(1:3);

% trans velocities
Jt5 = simple(jacobian(r5,qr)); % COM jacobian
Jt5l = simple(jacobian(T0_5(1:3,4),qr)); % Link jacobian
Jt5ld = subs(diff(subs(Jt5l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v5 = Jt5*qdr;

% trans acceleration
abar5 = jacobian(v5, qr)*qdr;
a5 = Jt5*qddr+abar5;

%Rot Matrix
R0_5 = T0_5(1:3,1:3);

% rot velocities
omegaTilde5 = subs((diff(subs(R0_5,qr ,qt),t)*R0_5'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega5 = [omegaTilde5(3,2)
         omegaTilde5(1,3)
         omegaTilde5(2,1)];
omega5 = simple(omega5);
Jr5 = simple(jacobian(omega5,qdr));
Jr5d = subs(diff(subs(Jr5,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar5 = jacobian(omega5,qr)*qdr;
alpha5 = Jr5*qddr+alphabar5;

clear omegaTilde5;


%% Kinematic 6th Body
disp(sprintf('\tKinematics 6th body'));
% trans position
r6 = T0_6*[rC6; 1];
r6 = r6(1:3);

% trans velocities
Jt6 = simple(jacobian(r6,qr)); % COM jacobian
Jt6l = simple(jacobian(T0_6(1:3,4),qr)); % Link jacobian
Jt6ld = subs(diff(subs(Jt6l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v6 = Jt6*qdr;

% trans acceleration
abar6 = jacobian(v6, qr)*qdr;
a6 = Jt6*qddr+abar6;

%Rot Matrix
R0_6 = T0_6(1:3,1:3);

% rot velocities
omegaTilde6 = subs((diff(subs(R0_6,qr ,qt),t)*R0_6'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega6 = [omegaTilde6(3,2)
         omegaTilde6(1,3)
         omegaTilde6(2,1)];
omega6 = simple(omega6);
Jr6 = simple(jacobian(omega6,qdr));
Jr6d = subs(diff(subs(Jr6,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar6 = jacobian(omega6,qr)*qdr;
alpha6 = Jr6*qddr+alphabar6;

clear omegaTilde6;


%% Kinematic 7th Body
disp(sprintf('\tKinematics 7th body'));
% trans position
r7 = T0_7*[rC7; 1];
r7 = r7(1:3);

% trans velocities
Jt7 = simple(jacobian(r7,qr)); % COM jacobian
Jt7l = simple(jacobian(T0_7(1:3,4),qr)); %Link jacobian
Jt7ld = subs(diff(subs(Jt7l,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Link Jacobian time derivative
v7 = Jt7*qdr;

% trans acceleration
abar7 = jacobian(v7, qr)*qdr;
a7 = Jt7*qddr+abar7;

%Rot Matrix
R0_7 = T0_7(1:3,1:3);

% rot velocities
omegaTilde7 = subs((diff(subs(R0_7,qr ,qt),t)*R0_7'),[diff(qt,t), qt], ...
                    [qdr, qr]);
omega7 = [omegaTilde7(3,2)
         omegaTilde7(1,3)
         omegaTilde7(2,1)];
omega7 = simple(omega7);
Jr7 = simple(jacobian(omega7,qdr));
Jr7d = subs(diff(subs(Jr7,qr, qt),t), [diff(qt,t), qt], [qdr, qr]); ...
%Jacobian time derivative

% rot accelerations
alphabar7 = jacobian(omega7,qr)*qdr;
alpha7 = Jr7*qddr+alphabar7;

clear omegaTilde7;


%% Kinematic EE Body
disp(sprintf('\tKinematics EE body'));
% trans position
rEE = T0_EE*[0; 0; 0; 1];
rEE = rEE(1:3);

% trans velocities
JtEE = simple(jacobian(T0_EE(1:3,4),qr)); %Link jacobian



%% build big matrices

disp(sprintf('\tbuild big matrices'));

transformations = [T0_1 T0_2 T0_3 T0_4 T0_5 T0_6 T0_7 T0_EE];
jacobians = [Jt1l.' Jr1.' Jt2l.' Jr2.' Jt3l.' Jr3.' ...
             Jt4l.' Jr4.' Jt5l.' Jr5.' Jt6l.' Jr6.' ...
             Jt7l.' Jr7.'];
jacobiansEE = [Jt1l.' Jr1.' Jt2l.' Jr2.' Jt3l.' Jr3.' ...
               Jt4l.' Jr4.' Jt5l.' Jr5.' Jt6l.' Jr6.' ...
               Jt7l.' Jr7.' JtEE.' Jr7.'];

jacobiansD = [Jt1ld.' Jr1d.' Jt2ld.' Jr2d.' ...
              Jt3ld.' Jr3d.' Jt4ld.' Jr4d.' ...
              Jt5ld.' Jr5d.' Jt6ld.' Jr6d.' ...
              Jt7ld.' Jr7d.'];
J1 = [Jt1l.' Jr1.'];
J2 = [Jt2l.' Jr2.'];
J3 = [Jt3l.' Jr3.'];
J4 = [Jt4l.' Jr4.'];
J5 = [Jt5l.' Jr5.'];
J6 = [Jt6l.' Jr6.'];
J7 = [Jt7l.' Jr7.'];
JEE = [JtEE.' Jr7.']; % There is no furter rotation hence the
                      % rotation jacobian stays the same

disp(sprintf('\tbuild body jacobians'));

BJ1 = simple(J1*[R0_1 zeros(3,3); zeros(3,3) R0_1]);
BJ2 = simple(J2*[R0_2 zeros(3,3); zeros(3,3) R0_2]);
BJ3 = simple(J3*[R0_3 zeros(3,3); zeros(3,3) R0_3]);
BJ4 = simple(J4*[R0_4 zeros(3,3); zeros(3,3) R0_4]);
BJ5 = simple(J5*[R0_5 zeros(3,3); zeros(3,3) R0_5]);
BJ6 = simple(J6*[R0_6 zeros(3,3); zeros(3,3) R0_6]);
BJ7 = simple(J7*[R0_7 zeros(3,3); zeros(3,3) R0_7]);
BJEE = simple(JEE*[T0_EE(1:3,1:3) zeros(3,3); zeros(3,3) T0_EE(1:3,1:3)]); 
           
       
bodyJacobians = [BJ1 BJ2 BJ3 BJ4 BJ5 BJ6 BJ7];
bodyJacobiansEE = [bodyJacobians BJEE];