function [tau, f0, n0 ] = forwardBackward(omegaS, omegadS, aS, q, qd, qdd, ...
                                 m, m0, I0,  I1, I2, I3, I4, I5, I6, I7, R0_1, ...
                                 R1_2, R2_3, R3_4, R4_5, R5_6, R6_7, ...
                                 rC0, rC1, rC2, rC3, rC4, rC5, rC6, rC7, rL01, rL12, ...
                                 rL23, rL34, rL45, rL56, rL67, F_ext, M_ext)


    disp(sprintf('\t\tForward Iteration'));
    disp(sprintf('\t\t#################'));
    %%0th link
    [omega0, omegad0, a0, aC0, F0, N0] ...
        = forwardIteration(omegaS, omegadS, aS, rC0, [0;0;0], m0, I0, ...
                                  eye(3,3), 0, 0, 0);
        
    
    %% 1st Link
    disp(sprintf('\t\t\t1st Link Iteration i = 0'));
    [omega1, omegad1, a1, aC1, F1, N1] ...
        = forwardIteration(omega0, omegad0, a0, rC1, rL01, m(1), I1, ...
                                  R0_1.', q(1), qd(1), qdd(1));
    
    %% 2nd Link
    disp(sprintf('\t\t\t2nd Link Iteration i = 1'));
    [omega2, omegad2, a2, aC2, F2, N2] ...
        = forwardIteration(omega1, omegad1, a1, rC2, rL12, m(2), I2, ...
                                  R1_2.', q(2), qd(2), qdd(2));

    %% 3rd Link
    disp(sprintf('\t\t\t3rd Link Iteration i = 2'));
    [omega3, omegad3, a3, aC3, F3, N3] ...
        = forwardIteration(omega2, omegad2, a2, rC3, rL23, m(3), I3, ...
                                  R2_3.', q(3), qd(3), qdd(3));

    %% 4th Link
    disp(sprintf('\t\t\t4th Link Iteration i = 3'));
    [omega4, omegad4, a4, aC4, F4, N4] ...
        = forwardIteration(omega3, omegad3, a3, rC4, rL34, m(4), I4, ...
                                  R3_4.', q(4), qd(4), qdd(4));

    %% 5th Link
    disp(sprintf('\t\t\t5th Link Iteration i = 4'));
    [omega5, omegad5, a5, aC5, F5, N5] ...
        = forwardIteration(omega4, omegad4, a4, rC5, rL45, m(5), I5, ...
                                  R4_5.', q(5), qd(5), qdd(5));

    %% 6th Link
    disp(sprintf('\t\t\t6th Link Iteration i = 5'));
    [omega6, omegad6, a6, aC6, F6, N6] ...
        = forwardIteration(omega5, omegad5, a5, rC6, rL56, m(6), I6, ...
                                  R5_6.', q(6), qd(6), qdd(6));

    %% 7th Link
    disp(sprintf('\t\t\t7th Link Iteration i = 6'));
    [omega7, omegad7, a7, aC7, F7, N7] ...
        = forwardIteration(omega6, omegad6, a6, rC7, rL67, m(7), I7, ...
                                  R6_7.', q(7), qd(7), qdd(7));

    %% Backward Iteration
    disp(sprintf('\n\t\tBackward Iteration'));
    disp(sprintf('\t\t##################'));
    
    %% 7th Link
    disp(sprintf('\t\t\t7th Link Iteration i = 7'));
    [f7, n7, tau7] = backwardIteration(eye(3,3), F_ext, F7, M_ext, N7, ...
                                       rC7, zeros(3,1));
    
    %% 6th Link
    disp(sprintf('\t\t\t6th Link Iteration i = 6'));
    [f6, n6, tau6] = backwardIteration(R6_7, f7, F6, n7, N6, ...
                                       rC6, rL67);

    %% 5th Link
    disp(sprintf('\t\t\t5th Link Iteration i = 5'));
    [f5, n5, tau5] = backwardIteration(R5_6, f6, F5, n6, N5, ...
                                       rC5, rL56);

    %% 4th Link
    disp(sprintf('\t\t\t4th Link Iteration i = 4'));
    [f4, n4, tau4] = backwardIteration(R4_5, f5, F4, n5, N4, ...
                                       rC4, rL45);
    
    %% 3rd Link
    disp(sprintf('\t\t\t3rd Link Iteration i = 3'));
    [f3, n3, tau3] = backwardIteration(R3_4, f4, F3, n4, N3, ...
                                       rC3, rL34);
    
    %% 2nd Link
    disp(sprintf('\t\t\t2nd Link Iteration i = 2'));
    [f2, n2, tau2] = backwardIteration(R2_3, f3, F2, n3, N2, ...
                                       rC2, rL23);
    
    %% 1st Link
    disp(sprintf('\t\t\t1st Link Iteration i = 1'));
    [f1, n1, tau1] = backwardIteration(R1_2, f2, F1, n2, N1, ...
                                       rC1, rL12);
    
    %% 0th Link
    disp(sprintf('\t\t\t0th Link Iteration i = 0'));
    [f0, n0, tau0] = backwardIteration(R0_1, f1, F0, n1, N0, ...
                                       rC0, rL01);
   
    tau = [tau1; tau2; tau3; tau4; tau5; tau6; tau7];
end



function [omega, omegad, a, aC, F, N] = forwardIteration(omega0, omegad0, a0, rC, rL, m, I,  ...
                                                      R10, q, qd, qdd)
    % INPUTS
% omega0, omegad0, a0:  rotational velocity, acceleration and
%                       trans acceleration of Body i-1 in Frame i-1
% rC:                   Center of mass of link i in Frame i
% rL:                   Origin of frame i in frame i-1
% m:                    Mass of link i
% I:                    Inertia of link i in COM in Frame i
% R10;                  i_R_i-1
% q, qd, qdd:           position, velocity, acceleration of joint i
    
    % OUTPUTS
%omega, omegad, a:      rotational velocity, acceleration and
%                       trans acceleration of Body i in Frame i
% aC                    trans acceleration COM
% F                     Force at COM from acceleration
% N                     Torque at COM from acceleration
        
    omega  = R10*omega0 + [0; 0; qd];
    omegad = R10*omegad0+cross(R10*omega0, [0;0;qd])+[0; 0; qdd];
    a      = R10*(cross(omegad0, rL)+ cross(omega0, cross(omega0, rL)) + ...
                a0);
    aC     = cross(omegad, rC)+cross(omega, cross(omega, rC))+a;
    F      = m*aC;
    N      = I*omegad+cross(omega,I*omega);
    
end


function [f, n, tau] = backwardIteration(R01, f1, F, n1, N, rC, rL)
    % INPUTS
% R01:  i+1_R_i
% f1:   Force from body i+1
% F:    Force at COM from Acceleration
% n1:   Torque from body i+1
% N:    Torque at COM from Acceleration
% rC:   Center of mass of link i in Frame i
% rL:   Origin of frame i+1 in frame i

    % OUTPUTS
% f:    Forces at frame i
% n:    Torques at frame i
% tau:  Torques around z at frame i
        
    f = R01*f1+F;
    n = N+R01*n1+cross(rC, F)+cross(rL, R01*f1);
    tau = n(3);
end