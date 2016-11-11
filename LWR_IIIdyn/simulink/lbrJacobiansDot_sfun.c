/************************++++++++++++++*******************/
/* Time derived jacobians of the LBR3 with Floating Base */
/*    generated with maple                               */
/*          Author: Kai Krieger                          */
/*                  18.8.2011                            */
/*********************************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrJacobiansDot_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>

/* Calculations */
#include "LWR_IIIdyn.h"


static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumContStates(    S, 0);   /* number of continuous states           */
    ssSetNumDiscStates(    S, 0);   /* number of discrete states             */

    /**********/
    /* INPUTS */
    /**********/
    ssSetNumInputPorts(S, 2);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 7);  /* qd */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/

    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/

    /***********/
    /* OUTPUTS */
    /***********/ 
    ssSetNumOutputPorts( S, 7);   /* number of outputs */
    ssSetOutputPortMatrixDimensions(S, 0, 7, 6); /* 0_Jd_1 */
    ssSetOutputPortMatrixDimensions(S, 1, 7, 6); /* 0_Jd_2 */
    ssSetOutputPortMatrixDimensions(S, 2, 7, 6); /* 0_Jd_3 */
    ssSetOutputPortMatrixDimensions(S, 3, 7, 6); /* 0_Jd_4 */
    ssSetOutputPortMatrixDimensions(S, 4, 7, 6); /* 0_Jd_5 */
    ssSetOutputPortMatrixDimensions(S, 5, 7, 6); /* 0_Jd_6 */
    ssSetOutputPortMatrixDimensions(S, 6, 7, 6); /* 0_Jd_7 */



    ssSetNumSampleTimes(   S, 0);   /* number of sample times                */
    ssSetNumSFcnParams(    S, 0);   /* number of input arguments             */
    ssSetNumRWork(         S, 0);   /* number of real work vector elements   */
    ssSetNumIWork(         S, 0);   /* number of integer work vector elements*/
    ssSetNumPWork(         S, 0);   /* number of pointer work vector elements*/
}


static void mdlInitializeSampleTimes(SimStruct *S)
{ ; }

#undef MDL_START

/*********************/
/* DEFINE INPUTS     */
/*********************/
#define q       ssGetInputPortRealSignal(S,0)
#define qd      ssGetInputPortRealSignal(S,1)


/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define Jd1     ssGetOutputPortRealSignal(S,0)
#define Jd2     ssGetOutputPortRealSignal(S,1)
#define Jd3     ssGetOutputPortRealSignal(S,2)
#define Jd4     ssGetOutputPortRealSignal(S,3)
#define Jd5     ssGetOutputPortRealSignal(S,4)
#define Jd6     ssGetOutputPortRealSignal(S,5)
#define Jd7     ssGetOutputPortRealSignal(S,6)


static void mdlOutputs(SimStruct *S, int tid)
{
  int i,j;

  /* CALCULATE THE JACOBIAN */
  double allJac[7][42];
  lbrZeroJacobiansDotDouble(q, qd, allJac);

  /*WRITE IT TO OUTPUT*/
  for (i=0; i<7; i++) {
    for (j=0; j<6; j++) {
      Jd1[i+j*7] = allJac[i][j];
      Jd2[i+j*7] = allJac[i][j+6];
      Jd3[i+j*7] = allJac[i][j+12];
      Jd4[i+j*7] = allJac[i][j+18];
      Jd5[i+j*7] = allJac[i][j+24];
      Jd6[i+j*7] = allJac[i][j+30];
      Jd7[i+j*7] = allJac[i][j+36];
    }
  }
}


#undef MDL_UPDATE
#undef MDL_DERIVATIVES

static void mdlTerminate(SimStruct *S)
{ ; }

#ifdef	MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
