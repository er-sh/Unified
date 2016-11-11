/*******************************************/
/*    Massmatrix of the LBR3               */
/*    generated with maple                 */
/*          Author: Kai Krieger            */
/*                  11.1.2012              */
/*******************************************/


/*#define S_FUNCTION_LEVEL 2*/
#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrDynMass_sfun


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
    ssSetNumInputPorts(S, 4);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 1);  /* mass  */
    ssSetInputPortWidth( S, 2, 3);  /* position of COM of EE in TCP  */
    ssSetInputPortWidth( S, 3, 3);  /* main Axes Inertia of EE in TCP  */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 3, true); /*direct input signal access*/

    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 2, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 3, 1);   /* direct feedthrough flag*/


    /***********/
    /* OUTPUTS */
    /***********/
    ssSetNumOutputPorts(S, 1);   /* number of outputs */
    ssSetOutputPortMatrixDimensions(S, 0, 7, 7); /*mass Matrix */


    ssSetNumSampleTimes(   S, 0);   /* number of sample times                */
    ssSetNumSFcnParams(    S, 0);   /* number of input arguments             */
    ssSetNumRWork(         S, 0);   /* number of real work vector elements   */
    ssSetNumIWork(         S, 0);   /* number of integer work vector elements*/
    ssSetNumPWork(         S, 0);   /* number of pointer work vector elements*/
}


static void mdlInitializeSampleTimes(SimStruct *S)
{ ; }
#undef MDL_START  /* Change to #undef to remove function */

/*********************/
/* DEFINE INPUTS     */
/*********************/
#define q       ssGetInputPortRealSignal(S,0)
#define mEE     ssGetInputPortRealSignal(S,1)[0]
#define rEE     ssGetInputPortRealSignal(S,2)
#define iEE     ssGetInputPortRealSignal(S,3)

/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y       ssGetOutputPortRealSignal(S,0)
 

static void mdlOutputs(SimStruct *S, int tid)
{
  double returnValue[7][7];

  int i,j;


  /* CALCULATE THE DYNAMICS */
  lbrMassDouble(q, mEE, rEE, iEE, returnValue);

  /* assign the outputs */
  for(i=0;i<7;i++) {
    for (j=0; j<7; j++) {
      y[i+j*7] = returnValue[i][j];
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
