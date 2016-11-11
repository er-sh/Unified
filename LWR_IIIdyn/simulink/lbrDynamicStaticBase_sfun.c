/*******************************************/
/* Dynamics of the LBR3                    */
/*    generated with maple                 */
/*          Author: Kai Krieger            */
/*                  18.6.2012              */
/*******************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrDynamicStaticBase_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>


/* Dynamics calculation */
#include "LWR_IIIdyn.h"


static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumContStates(    S, 0);   /* number of continuous states           */
    ssSetNumDiscStates(    S, 0);   /* number of discrete states             */

    /**********/
    /* INPUTS */
    /**********/
    ssSetNumInputPorts(S, 6);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 7);  /* qd */
    ssSetInputPortWidth( S, 2, 1);  /* mass  */
    ssSetInputPortWidth( S, 3, 3);  /* position of COM of EE in TCP  */
    ssSetInputPortWidth( S, 4, 3);  /* main Axes Inertia of EE in TCP  */
    ssSetInputPortWidth( S, 5, 3);  /* gravitational acceleration  */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 3, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 4, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 5, true); /*direct input signal access*/


    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 2, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 3, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 4, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 5, 1);   /* direct feedthrough flag*/



    /***********/
    /* OUTPUTS */
    /***********/
    ssSetNumOutputPorts( S, 3);   /* number of outputs */
    ssSetOutputPortWidth(S, 0, 7);  /* gravitational part */
    ssSetOutputPortWidth(S, 1, 7);  /* centrifugal part */
    ssSetOutputPortMatrixDimensions(S, 2, 7, 7); /*mass Matrix */


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
#define mEE     ssGetInputPortRealSignal(S,2)[0]
#define rEE     ssGetInputPortRealSignal(S,3)
#define iEE     ssGetInputPortRealSignal(S,4)
#define g       ssGetInputPortRealSignal(S,5)


/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y1_out  ssGetOutputPortRealSignal(S,0)
#define y2_out  ssGetOutputPortRealSignal(S,1)
#define y3_out  ssGetOutputPortRealSignal(S,2)


static void mdlOutputs(SimStruct *S, int tid)
{
  /***********/
  /* OUTPUTS */
  /***********/
  double returnValue[7][9];

  int i,j;

  /* CALCULATE THE DYNAMICS */
  lbrDynamicDouble(q, qd, mEE, rEE, iEE, g, returnValue);

  /* assign the outputs */
  for(i=0;i<7;i++) {
    y1_out[i]  = returnValue[i][1];
    y2_out[i]  = returnValue[i][0];
    for (j=2; j<9; j++) {
      y3_out[i+(j-2)*7] = returnValue[i][j];
    }
  }
}

#undef MDL_UPDATE
#undef MDL_DERIVATIVES

static void mdlTerminate(SimStruct *S)
{;}

#ifdef	MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
