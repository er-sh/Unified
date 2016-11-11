
%% INITIALIZE VARIABLES

symbolic = 0;
% time
disp(sprintf('\ttime'));
t = sym('t', 'real');

%gravitation
disp(sprintf('\tgravitation'));
g1r = sym('g1r', 'real');
g2r = sym('g2r', 'real');
g3r = sym('g3r', 'real');
gr = [g1r; g2r; g3r];

syms g1 g2 g3;
g = [g1; g2; g3];


% Moving ZeroFrame
disp(sprintf('\tMoving Base Frame'));
a01r = sym('a01r', 'real');
a02r = sym('a02r', 'real');
a03r = sym('a03r', 'real');
a0r = [a01r; a02r; a03r];

syms a01 a02 a03;
a0 = [a01; a02; a03];

omega01r = sym('omega01r', 'real');
omega02r = sym('omega02r', 'real');
omega03r = sym('omega03r', 'real');
omega0r = [omega01r; omega02r; omega03r];

syms omega01 omega02 omega03;
omega0 = [omega01; omega02; omega03];

omegad01r = sym('omegad01r', 'real');
omegad02r = sym('omegad02r', 'real');
omegad03r = sym('omegad03r', 'real');
omegad0r = [omegad01r; omegad02r; omegad03r];

syms omegad01 omegad02 omegad03;
omegad0 = [omegad01; omegad02; omegad03];

% External Forces in EE
disp(sprintf('\tExternal Forces'));
% $$$ syms F_ext1 F_ext2 F_ext3;
% $$$ syms M_ext1 M_ext2 M_ext3;
% $$$ 
% $$$ F_ext = [F_ext1; F_ext2; F_ext3];
% $$$ M_ext = [M_ext1; M_ext2; M_ext3];

F_ext = sym('vector(3,F_ext)');
M_ext = sym('vector(3,M_ext)');

% Jointangles
disp(sprintf('\tJointangles'));
q1r = sym('q1r', 'real');
q2r = sym('q2r', 'real');
q3r = sym('q3r', 'real');
q4r = sym('q4r', 'real');
q5r = sym('q5r', 'real');
q6r = sym('q6r', 'real');
q7r = sym('q7r', 'real');

q1t = sym('q1t(t)');
q2t = sym('q2t(t)');
q3t = sym('q3t(t)');
q4t = sym('q4t(t)');
q5t = sym('q5t(t)');
q6t = sym('q6t(t)');
q7t = sym('q7t(t)');

q1dr = sym('q1dr', 'real');
q2dr = sym('q2dr', 'real');
q3dr = sym('q3dr', 'real');
q4dr = sym('q4dr', 'real');
q5dr = sym('q5dr', 'real');
q6dr = sym('q6dr', 'real');
q7dr = sym('q7dr', 'real');

q1ddr = sym('q1ddr', 'real');
q2ddr = sym('q2ddr', 'real');
q3ddr = sym('q3ddr', 'real');
q4ddr = sym('q4ddr', 'real');
q5ddr = sym('q5ddr', 'real');
q6ddr = sym('q6ddr', 'real');
q7ddr = sym('q7ddr', 'real');


qr = [q1r; q2r; q3r; q4r; q5r; q6r; q7r];
qt = [q1t; q2t; q3t; q4t; q5t; q6t; q7t];
qdr = [q1dr; q2dr; q3dr; q4dr; q5dr; q6dr; q7dr];
qddr = [q1ddr; q2ddr; q3ddr; q4ddr; q5ddr; q6ddr; q7ddr];

syms q1 q2 q3 q4 q5 q6 q7;
q = [q1; q2; q3; q4; q5; q6; q7]; 

syms q1d q2d q3d q4d q5d q6d q7d;
qd = [q1d; q2d; q3d; q4d; q5d; q6d; q7d];

syms q1dd q2dd q3dd q4dd q5dd q6dd q7dd;
qdd = [q1dd; q2dd; q3dd; q4dd; q5dd; q6dd; q7dd];

% $$$ q = sym('q:=vector(7)');
% $$$ qd = sym('qd:=vector(7)');
% $$$ qdd = sym('vector(7,qdd)');


%Input torques
disp(sprintf('\tTorque'));
tau1r = sym('tau1r', 'real');
tau2r = sym('tau2r', 'real');
tau3r = sym('tau3r', 'real');
tau4r = sym('tau4r', 'real');
tau5r = sym('tau5r', 'real');
tau6r = sym('tau6r', 'real');
tau7r = sym('tau7r', 'real');

taur = [tau1r; tau2r; tau3r; tau4r; tau5r; tau6r; tau7r];
syms tau1 tau2 tau3 tau4 tau5 tau6 tau7;
tau = [tau1; tau2; tau3; tau4; tau5; tau6; tau7];

% $$$ tau = sym('vector(7,tau)');

%Masses
disp(sprintf('\tMasses'));
if symbolic > 0.5
    m0 = sym('m0', 'positive'); % Basis ca. 1.5 kg
    m1 = sym('m1', 'positive'); %1st Link
    m2 = sym('m2', 'positive');
    m3 = sym('m3', 'positive');
    m4 = sym('m4', 'positive');
    m5 = sym('m5', 'positive');
    m6 = sym('m6', 'positive');
    m7 = sym('m7', 'positive');
else %Mass in kg 
    m0 = 1.0635; %Nur Gehäuse
    m1 = 2.7082;
    m2 = 2.7100;
    m3 = 2.5374;
    m4 = 2.5053;
    m5 = 1.3028;
    m6 = 1.5686;
    m7 = 0.1943; % hier noch einen additiven anteil für Greifer
end
     % end effector
syms mEE IEE1 IEE2 IEE3;
m = [m1; m2; m3; m4; m5; m6; m7+mEE];


% Inertia
disp(sprintf('\tInertias'));
if symbolic > 0.5
    I01 = sym('I11', 'real');
    I02 = sym('I12', 'real');
    I03 = sym('I13', 'real');
    I0 = diag([I01 I02 I03]);

    I11 = sym('I11', 'real');
    I12 = sym('I12', 'real');
    I13 = sym('I13', 'real');
    I1 = diag([I11 I12 I13]);
    
    I21 = sym('I21', 'real');
    I22 = sym('I22', 'real');
    I23 = sym('I23', 'real');
    I2 = diag([I21 I22 I23]);
    
    I31 = sym('I31', 'real');
    I32 = sym('I32', 'real');
    I33 = sym('I33', 'real');
    I3 = diag([I31 I32 I33]);
I41 = sym('I41', 'real');
    I42 = sym('I42', 'real');
    I43 = sym('I43', 'real');
    I4 = diag([I41 I42 I43]);
        
    I51 = sym('I51', 'real');
    I52 = sym('I52', 'real');
    I53 = sym('I53', 'real');
    I5 = diag([I51 I52 I53]);
    
    I61 = sym('I61', 'real');
    I62 = sym('I62', 'real');
    I63 = sym('I63', 'real');
    I6 = diag([I61 I62 I63]);
    
    I71 = sym('I71', 'real');
    I72 = sym('I72', 'real');
    I73 = sym('I73', 'real');
    I7 = diag([I71 I72 I73]);
else
    I0= [3.3526275e+06  2.0244413e+04  3.1847381e+03
         2.0244413e+04  3.1305429e+06  3.0888464e+04
         3.1847381e+03  3.0888464e+04  4.5838576e+06]*10^(-9);
    %NUR GEHÄUSE
    
    
    I1= [0.0216417  0.0000000  0.0000000
         0.0000000  0.0214810 -0.0022034
         0.0000000 -0.0022034  0.0049639];
    
    I2= [0.0244442 0.0000000 0.0000000
         0.0000000 0.0052508 0.0036944
         0.0000000 0.0036944 0.0239951];
    
    I3= [0.0213026 0.0000000 0.0000000
         0.0000000 0.0210353 0.0022204
         0.0000000 0.0022204 0.0046970];
    
    I4= [0.0231668 0.0000000 0.0000000
         0.0000000 0.0048331 -0.0034937
         0.0000000 -0.0034937 0.0227509];
    
    I5= [0.0081391 0.0000000 0.0000000
         0.0000000 0.0075015 -0.0021299
         0.0000000 -0.0021299 0.0030151];
    
    I6= [0.0033636 0.0000000 0.0000000
         0.0000000 0.0029876 0.0000000
         0.0000000 0.0000000 0.0029705];
    
    I7= [0.0000793 0.0000000 0.0000000
         0.0000000 0.0000783 0.0000000
         0.0000000 0.0000000 0.0001203];
end
I7 = I7+diag([IEE1 IEE2 IEE3]);

% Massenmittelpunktpositionen in lokalen Gelenkkoordinaten
r01 = sym('r01', 'real');
r02 = sym('r02', 'real');
r03 = sym('r03', 'real');

r11 = sym('r11', 'real');
r12 = sym('r12', 'real');
r13 = sym('r13', 'real');

r21 = sym('r21', 'real');
r22 = sym('r22', 'real');
r23 = sym('r23', 'real');

r31 = sym('r31', 'real');
r32 = sym('r32', 'real');
r33 = sym('r33', 'real');

r41 = sym('r41', 'real');
r42 = sym('r42', 'real');
r43 = sym('r43', 'real');

r51 = sym('r51', 'real');
r52 = sym('r52', 'real');
r53 = sym('r53', 'real');

r61 = sym('r61', 'real');
r62 = sym('r62', 'real');
r63 = sym('r63', 'real');

r71 = sym('r71', 'real');
r72 = sym('r72', 'real');
r73 = sym('r73', 'real');


if (symbolic > 0.5)
    rC0 = [r01; r02; r03];
    rC1 = [r11; r12; r13];
    rC2 = [r21; r22; r23];
    rC3 = [r31; r32; r33];
    rC4 = [r41; r42; r43];
    rC5 = [r51; r52; r53];
    rC6 = [r61; r62; r63];
    rC7 = [r71; r72; r73];
else
    rC0 = [0.0000499; -0.005809; 0.0388518];  % NUR GEHÄUSE
    rC1 = [0; 0.01698; -0.05913];
    rC2 = [0; 0.11090; 0.01410];
    rC3 = [0; -0.01628; -0.06621];
    rC4 = [0; -0.10538; 0.01525];
    rC5 = [0; 0.01566; -0.12511];
    rC6 = [0; 0.00283; -0.00228];
    rC7 = [0; 0; 0.06031];
end

% Endeffector
disp(sprintf('\tEndeffector'));
syms rCEE1 rCEE2 rCEE3;
rCEE = [rCEE1; rCEE2; rCEE3];
%rC7  = (rCEE*mEE+rC7*m7)/(m7+mEE);

rC7 = 1/(m7+mEE)*(mEE*rCEE + [0; 0; 0.011718233]);
%rC7  = (rCEE*mEE+rC7*m7)/(m7+mEE);

syms TCP_T_EE1 TCP_T_EE2 TCP_T_EE3 TCP_T_EE4;
syms TCP_T_EE5 TCP_T_EE6 TCP_T_EE7 TCP_T_EE8;
syms TCP_T_EE9 TCP_T_EE10 TCP_T_EE11 TCP_T_EE12;
syms TCP_T_EE13 TCP_T_EE14 TCP_T_EE15 TCP_T_EE16; 

T7_EE = [TCP_T_EE1 TCP_T_EE5 TCP_T_EE9 TCP_T_EE13
         TCP_T_EE2 TCP_T_EE6 TCP_T_EE10 TCP_T_EE14
         TCP_T_EE3 TCP_T_EE7 TCP_T_EE11 TCP_T_EE15
           0              0      0          1];
