
%dynamic = zeros(7,11)*q1;

dynamicFbase = [C G Htest M]; 
dynamic = [C G M];
reaction = [fR1; tauR1];
grav = G;
coriolis = C;
mass = M;
floating = Htest;

%JEE = simple(JEE);

disp(sprintf('\tmove variable to maple'));
disp(sprintf('\t\tComplete Dynamic'));

setmaple(grav);
setmaple(coriolis);
setmaple(mass);
setmaple(floating);
setmaple(dynamic);
setmaple(dynamicFbase);
setmaple(reaction);
setmaple(transformations);   
setmaple(jacobians);
setmaple(jacobiansEE);
setmaple(bodyJacobians);
setmaple(bodyJacobiansEE);
setmaple(jacobiansD);
setmaple(J1);
setmaple(J2);
setmaple(J3);
setmaple(J4);
setmaple(J5);
setmaple(J6);
setmaple(J7);
setmaple(JEE);
setmaple(BJ1);
setmaple(BJ2);
setmaple(BJ3);
setmaple(BJ4);
setmaple(BJ5);
setmaple(BJ6);
setmaple(BJ7);
setmaple(BJEE);
setmaple(T0_1);
setmaple(T0_2);
setmaple(T0_3);
setmaple(T0_4);
setmaple(T0_5);
setmaple(T0_6);
setmaple(T0_7);
setmaple(T0_EE);

disp(sprintf('\tSubstitute in Maple'));
maple iEE:=vector(3);
maple dynamic:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],dynamic);
maple dynamicFbase:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],dynamicFbase);
maple reaction:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],reaction);
maple coriolis:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],coriolis);
maple mass:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],mass);
maple floating:=subs(IEE1=iEE[1],IEE2=iEE[2],IEE3=iEE[3],floating);

maple a0:=vector(3);
maple dynamic:=subs(a01=a0[1],a02=a0[2],a03=a0[3],dynamic);
maple dynamicFbase:=subs(a01=a0[1],a02=a0[2],a03=a0[3],dynamicFbase);
maple reaction:=subs(a01=a0[1],a02=a0[2],a03=a0[3],reaction);
maple floating:=subs(a01=a0[1],a02=a0[2],a03=a0[3],floating);

maple g:=vector(3);
maple dynamic:=subs(g1=g[1],g2=g[2],g3=g[3],dynamic);
maple dynamicFbase:=subs(g1=g[1],g2=g[2],g3=g[3],dynamicFbase);
maple reaction:=subs(g1=g[1],g2=g[2],g3=g[3],reaction);
maple grav:=subs(g1=g[1],g2=g[2],g3=g[3],grav);

maple omega0:=vector(3);
maple dynamic:=subs(omega01=omega0[1],omega02=omega0[2],omega03=omega0[3],dynamic);
maple dynamicFbase:=subs(omega01=omega0[1],omega02=omega0[2],omega03=omega0[3],dynamicFbase);
maple reaction:=subs(omega01=omega0[1],omega02=omega0[2],omega03=omega0[3],reaction);
maple floating:=subs(omega01=omega0[1],omega02=omega0[2],omega03=omega0[3],floating);

maple omegad0:=vector(3);
maple dynamic:=subs(omegad01=omegad0[1],omegad02=omegad0[2],omegad03=omegad0[3],dynamic);
maple dynamicFbase:=subs(omegad01=omegad0[1],omegad02=omegad0[2],omegad03=omegad0[3],dynamicFbase);
maple reaction:=subs(omegad01=omegad0[1],omegad02=omegad0[2],omegad03=omegad0[3],reaction);
maple floating:=subs(omegad01=omegad0[1],omegad02=omegad0[2],omegad03=omegad0[3],floating);

maple rEE:=vector(3);
maple dynamic:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],dynamic);
maple dynamicFbase:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],dynamicFbase);
maple reaction:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],reaction);
maple transformations:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],transformations);
maple coriolis:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],coriolis);
maple grav:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],grav);
maple mass:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],mass);
maple floating:=subs(rCEE1=rEE[1],rCEE2=rEE[2],rCEE3=rEE[3],floating);

maple q:=vector(7);
maple dynamic:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],dynamic);
maple dynamicFbase:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],dynamicFbase);
maple reaction:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],reaction);
maple transformations:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],transformations);
maple jacobians:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],jacobians);
maple jacobiansEE:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],jacobiansEE);
maple bodyJacobians:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],bodyJacobians);
maple bodyJacobiansEE:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],bodyJacobiansEE);
maple jacobiansD:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],jacobiansD);
maple J1:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J1);
maple J2:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J2);
maple J3:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J3);
maple J4:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J4);
maple J5:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J5);
maple J6:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J6);
maple J7:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],J7);
maple JEE:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],JEE);
maple BJ1:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ1);
maple BJ2:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ2);
maple BJ3:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ3);
maple BJ4:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ4);
maple BJ5:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ5);
maple BJ6:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ6);
maple BJ7:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJ7);
maple BJEE:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],BJEE);
maple T0_1:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_1);
maple T0_2:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_2);
maple T0_3:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_3);
maple T0_4:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_4);
maple T0_5:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_5);
maple T0_6:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_6);
maple T0_7:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_7);
maple T0_EE:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],T0_EE);
maple coriolis:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],coriolis);
maple grav:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],grav);
maple mass:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],mass);
maple floating:=subs(q1r=q[1],q2r=q[2],q3r=q[3],q4r=q[4],q5r=q[5],q6r=q[6],q7r=q[7],floating);

maple qd:=vector(7);
maple dynamic:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],dynamic);
maple dynamicFbase:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],dynamicFbase);
maple reaction:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],reaction);
maple jacobiansD:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],jacobiansD);
maple coriolis:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],coriolis);
maple floating:=subs(q1dr=qd[1],q2dr=qd[2],q3dr=qd[3],q4dr=qd[4],q5dr=qd[5],q6dr=qd[6],q7dr=qd[7],floating);

maple qdd:=vector(7);
maple reaction:=subs(q1ddr=qdd[1],q2ddr=qdd[2],q3ddr=qdd[3],q4ddr=qdd[4],q5ddr=qdd[5],q6ddr=qdd[6],q7ddr=qdd[7],reaction);


maple T7_EE:=vector(16);
maple transformations:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],transformations);
maple transformations:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],transformations);
maple transformations:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],transformations);
maple transformations:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],transformations);
maple T0_EE:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],T0_EE);
maple T0_EE:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],T0_EE);
maple T0_EE:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],T0_EE);
maple T0_EE:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],T0_EE);
maple JEE:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],JEE);
maple JEE:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],JEE);
maple JEE:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],JEE);
maple JEE:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],JEE);
maple BJEE:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],BJEE);
maple BJEE:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],BJEE);
maple BJEE:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],BJEE);
maple BJEE:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],BJEE);
maple jacobiansEE:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],jacobiansEE);
maple jacobiansEE:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],jacobiansEE);
maple jacobiansEE:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],jacobiansEE);
maple jacobiansEE:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],jacobiansEE);
maple bodyJacobiansEE:=subs(TCP_T_EE1=T7_EE[1],TCP_T_EE2=T7_EE[2],TCP_T_EE3=T7_EE[3],TCP_T_EE4=T7_EE[4],bodyJacobiansEE);
maple bodyJacobiansEE:=subs(TCP_T_EE5=T7_EE[5],TCP_T_EE6=T7_EE[6],TCP_T_EE7=T7_EE[7],TCP_T_EE8=T7_EE[8],bodyJacobiansEE);
maple bodyJacobiansEE:=subs(TCP_T_EE9=T7_EE[9],TCP_T_EE10=T7_EE[10],TCP_T_EE11=T7_EE[11],TCP_T_EE12=T7_EE[12],bodyJacobiansEE);
maple bodyJacobiansEE:=subs(TCP_T_EE13=T7_EE[13],TCP_T_EE14=T7_EE[14],TCP_T_EE15=T7_EE[15],TCP_T_EE16=T7_EE[16],bodyJacobiansEE);



disp(sprintf('\tCodeGeneration'));
%needed
maple(['`codegen/array/entry` := proc(K, A)',...
       'description `modified by Joe Riel to work with nonsquare A`;',...
       'local i,x;',...
       'x := A[op(K)];'...
       'i := evaln(A[op(K)]);'...
       'i = `if`(i=x,undefined,x)'...
       'end proc: ']);
