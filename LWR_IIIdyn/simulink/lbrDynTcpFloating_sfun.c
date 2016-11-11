/*******************************************/
/* Dynamics of the LBR3 with Floating Base */
/*    generated with maple                 */
/*          Author: Kai Krieger            */
/*                  18.8.2011              */
/*******************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrDynTcpFloating_sfun

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
    ssSetNumInputPorts(S, 9);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 7);  /* qd */
    ssSetInputPortWidth( S, 2, 1);  /* mass  */
    ssSetInputPortWidth( S, 3, 3);  /* position of COM of EE in TCP  */
    ssSetInputPortWidth( S, 4, 3);  /* main Axes Inertia of EE in TCP  */
    ssSetInputPortWidth( S, 5, 3);  /* gravitational acceleration  */
    ssSetInputPortWidth( S, 6, 3);  /* translational base acceleration  */
    ssSetInputPortWidth( S, 7, 3);  /* rotational base velocity  */
    ssSetInputPortWidth( S, 8, 3);  /* rotational base acceleration
				       */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 3, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 4, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 5, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 6, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 7, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 8, true); /*direct input signal access*/


    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 2, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 3, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 4, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 5, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 6, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 7, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 8, 1);   /* direct feedthrough flag*/



    /***********/
    /* OUTPUTS */
    /***********/
    ssSetNumOutputPorts( S, 4);   /* number of outputs */
    ssSetOutputPortWidth(S, 0, 7);  /* gravitational part */
    ssSetOutputPortWidth(S, 1, 7);  /* centrifugal part */
    ssSetOutputPortWidth(S, 2, 7);  /* part from the floating base */
    ssSetOutputPortMatrixDimensions(S, 3, 7, 7); /*mass Matrix */


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
#define a0      ssGetInputPortRealSignal(S,6)
#define omega0  ssGetInputPortRealSignal(S,7)
#define alpha0  ssGetInputPortRealSignal(S,8)


/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y1_out  ssGetOutputPortRealSignal(S,0)
#define y2_out  ssGetOutputPortRealSignal(S,1)
#define y3_out  ssGetOutputPortRealSignal(S,2)
#define y4_out  ssGetOutputPortRealSignal(S,3)



static void mdlOutputs(SimStruct *S, int tid)
{
  /***********/
  /* OUTPUTS */
  /***********/
  double returnValue[7][10];

  int i,j;

  /* CALCULATE THE DYNAMICS */
  lbrDynamicFloatingDouble(q, qd, mEE, rEE, iEE, g, a0, omega0,
			   alpha0, returnValue);

  /* assign the outputs */
  for(i=0;i<7;i++) {
    y1_out[i]  = returnValue[i][1];
    y2_out[i]  = returnValue[i][0];
    y3_out[i]  = returnValue[i][2];
    for (j=3; j<10; j++) {
      y4_out[i+(j-3)*7] = returnValue[i][j];
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
