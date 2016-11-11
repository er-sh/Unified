disp(sprintf('\t\tPrepare Files'));
disp(sprintf('\t\t#############'));

headerInclude = ['/********************************************/\n' ...
                 '/*                                          */\n' ...
                 '/* AUTOMATICALLY GENERATED CODE DO NOT EDIT */\n' ...
                 '/*                                          */\n' ...
                 '/********************************************/\n\n' ...
                 '#include "LWR_IIIdyn.h"\n\n'];

fid = fopen('../../src_gen/lbrDynamic.c', 'w');
fprintf(fid, headerInclude);
fclose(fid);

fid = fopen('../../src_gen/lbrBodyJacobians.c', 'w');
fprintf(fid, headerInclude);
fclose(fid);

fid = fopen('../../src_gen/lbrTransformations.c', 'w');
fprintf(fid, headerInclude);
fclose(fid);

fid = fopen('../../src_gen/lbrZeroJacobians.c', 'w');
fprintf(fid, headerInclude);
fclose(fid);

fid = fopen('../../src_gen/lbrZeroJacboiansDot.c', 'w');
fprintf(fid, headerInclude);
fclose(fid);


disp(sprintf('\t\tCoriolis'));
disp(sprintf('\t\t#########'));
generateCode('coriolis', ...
             ['[q::array(1..7), qd::array(1..7), mEE, iEE::array(1..3), ' ...
              'rEE::array(1..3)]'], ...
             'lbrCoriolisTorques', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/coriolis.m');

disp(sprintf('\t\tGravitation'));
disp(sprintf('\t\t###########'));
generateCode('grav', ...
             '[mEE,g::array(1..3),q::array(1..7),rEE::array(1..3)]', ...
             'lbrGravitationalTorques', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/gravitation.m');

disp(sprintf('\t\tMass'));
disp(sprintf('\t\t####'));
maple mass:=convert(mass, matrix);
generateCode('mass', ...
             '[q::array(1..7),mEE::numeric,rEE::array(1..3),iEE::array(1..3)]', ...
             'lbrMass', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/mass.m');

disp(sprintf('\t\tFloating Base'));
disp(sprintf('\t\t#############'));
generateCode('floating', ...
             [ '[q::array(1..7), qd::array(1..7), mEE, iEE::array(1..3), ' ...
               'rEE::array(1..3), a0::array(1..3), omega0::array(1..3), ' ...
               'omegad0::array(1..3)]'], ...
             'lbrFloatingBaseTorques', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/floatingBaseTorques.m');

disp(sprintf('\t\tDynamic Matrix'));
disp(sprintf('\t\t##############'));
generateCode('dynamic', ...
             [ '[q::array(1..7), qd::array(1..7),'...
               'mEE, rEE::array(1..3), iEE::array(1..3), g::array(1..3)]'], ...
             'lbrDynamic', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/dynamic.m');

disp(sprintf('\t\tDynamic Matrix Floating Base'));
disp(sprintf('\t\t############################'));
generateCode('dynamicFbase', ...
             [ '[q::array(1..7),qd::array(1..7),'...
               'mEE,rEE::array(1..3),iEE::array(1..3),g::array(1..3),' ...
               'a0::array(1..3),omega0::array(1..3),omegad0::array(1..3)]' ], ...
             'lbrDynamicFloating', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/dynamicFloating.m');

disp(sprintf('\t\tReaction Forces'));
disp(sprintf('\t\t###############'));
maple reaction:=convert(reaction,array);
generateCode('reaction', ...
             [ '[q::array(1..7),qd::array(1..7),qdd::array(1..7),'...
               'mEE,rEE::array(1..3),iEE::array(1..3),g::array(1..3),' ...
               'a0::array(1..3),omega0::array(1..3),omegad0::array(1..3)]'], ...
             'lbrReactions', ...
             '../../src_gen/lbrDynamic.c', ...
             '../../matlabSrc/lbrReactions.m');

disp(sprintf('\t\tTransformation 0_T_1'));
disp(sprintf('\t\t####################'));
maple T0_1:=convert(T0_1, matrix);
generateCode('T0_1', ...
             '[q::array(1..7)]', ...
             'lbrT0_1_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T01.m');

disp(sprintf('\t\tTransformation 0_T_2'));
disp(sprintf('\t\t####################'));
maple T0_2:=convert(T0_2, matrix);
generateCode('T0_2', ...
             '[q::array(1..7)]', ...
             'lbrT0_2_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T02.m');

disp(sprintf('\t\tTransformation 0_T_3'));
disp(sprintf('\t\t####################'));
maple T0_3:=convert(T0_3, matrix);
generateCode('T0_3', ...
             '[q::array(1..7)]', ...
             'lbrT0_3_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T03.m');

disp(sprintf('\t\tTransformation 0_T_4'));
disp(sprintf('\t\t####################'));
maple T0_4:=convert(T0_4, matrix);
generateCode('T0_4', ...
             '[q::array(1..7)]', ...
             'lbrT0_4_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T04.m');

disp(sprintf('\t\tTransformation 0_T_5'));
disp(sprintf('\t\t####################'));
maple T0_5:=convert(T0_5, matrix);
generateCode('T0_5', ...
             '[q::array(1..7)]', ...
             'lbrT0_5_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T05.m');

disp(sprintf('\t\tTransformation 0_T_6'));
disp(sprintf('\t\t####################'));
maple T0_6:=convert(T0_6, matrix);
generateCode('T0_6', ...
             '[q::array(1..7)]', ...
             'lbrT0_6_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T06.m');

disp(sprintf('\t\tTransformation 0_T_7'));
disp(sprintf('\t\t####################'));
maple T0_7:=convert(T0_7, matrix);
generateCode('T0_7', ...
             '[q::array(1..7)]', ...
             'lbrT0_7_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T07.m');

disp(sprintf('\t\tTransformation 0_T_EE'));
disp(sprintf('\t\t#####################'));
maple T0_EE:=convert(T0_EE, matrix);
generateCode('T0_EE', ...
             '[q::array(1..7), T7_EE::array(1..16)]',...
             'lbrT0_EE_', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/T0EE.m');

disp(sprintf('\t\tTransformations'));
disp(sprintf('\t\t###############'));
generateCode('transformations', ...
             '[q::array(1..7), T7_EE::array(1..16)]', ...
             'lbrTransformations', ...
             '../../src_gen/lbrTransformations.c',...
             '../../matlabSrc/Transformations.m');

disp(sprintf('\t\tZero Jacobians'));
disp(sprintf('\t\t##############'));
generateCode('jacobians', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobians', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/ZeroJacobians.m');

disp(sprintf('\t\tZero Jacobians with EE'));
disp(sprintf('\t\t######################'));
generateCode('jacobiansEE', ...
             '[q::array(1..7), T7_EE::array(1..16)]', ...
             'lbrZeroJacobiansWithEE', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/ZeroJacobiansWithEE.m');

disp(sprintf('\t\tZero jacobians 1'));
disp(sprintf('\t\t################'));
generateCode('J1', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian1_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_1.m');

disp(sprintf('\t\tZero jacobians 2'));
disp(sprintf('\t\t################'));
generateCode('J2', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian2_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_2.m');

disp(sprintf('\t\tZero jacobians 3'));
disp(sprintf('\t\t################'));
generateCode('J3', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian3_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_3.m');

disp(sprintf('\t\tZero jacobians 4'));
disp(sprintf('\t\t################'));
generateCode('J4', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian4_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_4.m');

disp(sprintf('\t\tZero jacobians 5'));
disp(sprintf('\t\t################'));
generateCode('J5', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian5_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_5.m');

disp(sprintf('\t\tZero jacobians 6'));
disp(sprintf('\t\t################'));
generateCode('J6', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian6_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_6.m');

disp(sprintf('\t\tZero jacobians 7'));
disp(sprintf('\t\t################'));
generateCode('J7', ...
             '[q::array(1..7)]', ...
             'lbrZeroJacobian7_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_7.m');

disp(sprintf('\t\tZero jacobians EE'));
disp(sprintf('\t\t#################'));
generateCode('JEE', ...
             '[q::array(1..7), T7_EE::array(1..16)]', ...
             'lbrZeroJacobianEE_', ...
             '../../src_gen/lbrZeroJacobians.c',...
             '../../matlabSrc/O_JT_EE.m');

disp(sprintf('\t\tJacobiansDot'));
disp(sprintf('\t\t############'));
generateCode('jacobiansD', ...
             '[q::array(1..7), qd::array(1..7)]', ...
             'lbrZeroJacobiansDot', ...
             '../../src_gen/lbrZeroJacobiansDot.c',...
             '../../matlabSrc/ZeroJacobiansDot.m');

disp(sprintf('\t\tBody Jacobians'));
disp(sprintf('\t\t##############'));
generateCode('bodyJacobians', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobians', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/bodyJacobians.m');

disp(sprintf('\t\tBody Jacobians with EE'));
disp(sprintf('\t\t######################'));
generateCode('bodyJacobiansEE', ...
             '[q::array(1..7),T7_EE::array(1..16)]', ...
             'lbrBodyJacobiansWithEE', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/bodyJacobiansWithEE.m');

disp(sprintf('\t\tBody jacobians 1'));
disp(sprintf('\t\t################'));
generateCode('BJ1', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian1_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_1.m');

disp(sprintf('\t\tBody jacobians 2'));
disp(sprintf('\t\t################'));
generateCode('BJ2', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian2_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_2.m');

disp(sprintf('\t\tBody jacobians 3'));
disp(sprintf('\t\t################'));
generateCode('BJ3', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian3_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_3.m');

disp(sprintf('\t\tBody jacobians 4'));
disp(sprintf('\t\t################'));
generateCode('BJ4', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian4_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_4.m');

disp(sprintf('\t\tBody jacobians 5'));
disp(sprintf('\t\t################'));
generateCode('BJ5', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian5_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_5.m');

disp(sprintf('\t\tBody jacobians 6'));
disp(sprintf('\t\t################'));
generateCode('BJ6', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian6_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_6.m');

disp(sprintf('\t\tBody jacobians 7'));
disp(sprintf('\t\t################'));
generateCode('BJ7', ...
             '[q::array(1..7)]', ...
             'lbrBodyJacobian7_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_7.m');

disp(sprintf('\t\tBody jacobians EE'));
disp(sprintf('\t\t#################'));
generateCode('BJEE', ...
             '[q::array(1..7), T7_EE::array(1..16)]', ...
             'lbrBodyJacobianEE_', ...
             '../../src_gen/lbrBodyJacobians.c',...
             '../../matlabSrc/B_JT_EE.m');

