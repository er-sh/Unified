clear all;
close all;
maple restart;

% Calculates the LWR Model with a moving base Frame

addpath('../lib/');

%% INITIALIZE VARIABLES
disp('##############################');
disp(' Initialize the variables');
disp('##############################');


initialize;

disp(' ');


%% MAKE KINEMATICS
disp('##############################');
disp(' Kinematics');
disp('##############################');

kinematic;

disp(' ');

%% Newton Euler Forward
disp('##############################');
disp(' Newton Euler Forward Kinematics');
disp('##############################');


%qdr = zeros(7,1);

disp(sprintf('\tCoriolisForces'));
[C, XX, XXX] = ...
forwardBackward([0;0;0], [0;0;0], [0;0;0], qr, qdr, zeros(7,1), m, m0, I0, I1, I2, ...
                I3, I4, I5, I6, I7, R0_1, R1_2, R2_3, R3_4, R4_5, ...
                R5_6, R6_7, rC0, rC1 ,rC2, rC3, rC4, rC5, rC6, rC7, x0_1, x1_2, ...
                x2_3, x3_4, x4_5, x5_6, x6_7, zeros(3,1), zeros(3,1));


disp(sprintf('\tgravityVector'));
[G, XX, XXX] = ...
forwardBackward([0;0;0], [0;0;0], g, qr, zeros(7,1), zeros(7,1), m, m0, I0, I1, I2, ...
                I3, I4, I5, I6, I7, R0_1, R1_2, R2_3, R3_4, R4_5, ...
                R5_6, R6_7, rC0, rC1 ,rC2, rC3, rC4, rC5, rC6, rC7, x0_1, x1_2, ...
                x2_3, x3_4, x4_5, x5_6, x6_7, zeros(3,1), zeros(3,1));


disp(sprintf('\tMassMatrix'));
M = zeros(7,7)*qr(1);
for i=1:7
    q_sub = zeros(7,1);
    q_sub(i) = 1;
    disp(sprintf('\n\t%i. column Mass Matrix', i));
    [M(:,i), XX, XXX] = ...
        forwardBackward([0;0;0], [0;0;0], [0;0;0], qr, zeros(7,1), q_sub, m, m0, I0, I1, I2, ...
                        I3, I4, I5, I6, I7, R0_1, R1_2, R2_3, R3_4, R4_5, ...
                        R5_6, R6_7, rC0, rC1 ,rC2, rC3, rC4, rC5, rC6, rC7, x0_1, x1_2, ...
                        x2_3, x3_4, x4_5, x5_6, x6_7, zeros(3,1), zeros(3,1));
end


disp(sprintf('\tFloatingBase'));
[H, XX, XXX] = ...
forwardBackward(omega0, omegad0, a0, qr, qdr, zeros(7,1), m, m0, I0, I1, I2, ...
                I3, I4, I5, I6, I7, R0_1, R1_2, R2_3, R3_4, R4_5, ...
                R5_6, R6_7, rC0, rC1 ,rC2, rC3, rC4, rC5, rC6, rC7, x0_1, x1_2, ...
                x2_3, x3_4, x4_5, x5_6, x6_7, zeros(3,1), zeros(3,1));
Htest = H-C;


disp(sprintf('\tReaction Forces'));
[XXX, fR1, tauR1] = ...
forwardBackward(omega0, omegad0, a0+g, qr, qdr, qddr, m, m0, I0, I1, I2, ...
                I3, I4, I5, I6, I7, R0_1, R1_2, R2_3, R3_4, R4_5, ...
                R5_6, R6_7, rC0, rC1 ,rC2, rC3, rC4, rC5, rC6, rC7, x0_1, x1_2, ...
                x2_3, x3_4, x4_5, x5_6, x6_7, zeros(3,1), zeros(3,1));


%% Make Outputs
disp('##############################');
disp(' Code Generation');
disp('##############################');

codeGenerationInit;

codeGeneration;

%codeGenerationMatlab;


disp(' ');
disp('#######################################################');
disp('# Made the C files please compile the library with    #');
disp('# make                                                #');
disp('#######################################################');