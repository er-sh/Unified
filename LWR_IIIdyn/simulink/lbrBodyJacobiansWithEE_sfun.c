/***********************************************/
/* Jacobians of the LBR3 referring to the base */
/*    generated with maple                     */
/*          Author: Kai Krieger                */
/*                  13.11.2012                 */
/***********************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrBodyJacobiansWithEE_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>

/* Jacobians calculation */
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
    ssSetInputPortMatrixDimensions( S, 1, 4, 4);  /* Transformation from  TCP to EE */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/

    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/


    /***********/
    /* OUTPUTS */
    /***********/ 
    ssSetNumOutputPorts( S, 8);   /* number of outputs */
    ssSetOutputPortMatrixDimensions(S, 0, 7, 6); /* 0_J_1 */
    ssSetOutputPortMatrixDimensions(S, 1, 7, 6); /* 0_J_2 */
    ssSetOutputPortMatrixDimensions(S, 2, 7, 6); /* 0_J_3 */
    ssSetOutputPortMatrixDimensions(S, 3, 7, 6); /* 0_J_4 */
    ssSetOutputPortMatrixDimensions(S, 4, 7, 6); /* 0_J_5 */
    ssSetOutputPortMatrixDimensions(S, 5, 7, 6); /* 0_J_6 */
    ssSetOutputPortMatrixDimensions(S, 6, 7, 6); /* 0_J_7 */
    ssSetOutputPortMatrixDimensions(S, 7, 7, 6); /* 0_J_EE */



    ssSetNumSampleTimes(   S, 0);   /* number of sample times                */
    ssSetNumSFcnParams(    S, 0);   /* number of input arguments             */
    ssSetNumRWork(         S, 0);   /* number of real work vector elements   */
    ssSetNumIWork(         S, 0);   /* number of integer work vector elements*/
    ssSetNumPWork(         S, 0);   /* number of pointer work vector elements*/
}


static void mdlInitializeSampleTimes(SimStruct *S)
{;}

#undef MDL_START

/*********************/
/* DEFINE INPUTS     */
/*********************/
#define q       ssGetInputPortRealSignal(S,0)
#define T7EE    ssGetInputPortRealSignal(S,1)

/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define J1      ssGetOutputPortRealSignal(S,0)
#define J2      ssGetOutputPortRealSignal(S,1)
#define J3      ssGetOutputPortRealSignal(S,2)
#define J4      ssGetOutputPortRealSignal(S,3)
#define J5      ssGetOutputPortRealSignal(S,4)
#define J6      ssGetOutputPortRealSignal(S,5)
#define J7      ssGetOutputPortRealSignal(S,6)
#define JEE     ssGetOutputPortRealSignal(S,7)


static void mdlOutputs(SimStruct *S, int tid)
{
  int i,j;
  

  /* CALCULATE THE DYNAMICS */
  double allJac[7][48];
  lbrBodyJacobiansWithEEDouble(q, T7EE, allJac);

  /*WRITE IT TO OUTPUT*/
  for (i=0; i<7; i++) {
    for (j=0; j<6; j++) {
      J1[i+j*7]  = allJac[i][j];
      J2[i+j*7]  = allJac[i][j+6];
      J3[i+j*7]  = allJac[i][j+12];
      J4[i+j*7]  = allJac[i][j+18];
      J5[i+j*7]  = allJac[i][j+24];
      J6[i+j*7]  = allJac[i][j+30];
      J7[i+j*7]  = allJac[i][j+36];
      JEE[i+j*7] = allJac[i][j+42];
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
