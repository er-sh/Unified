/*******************************************/
/* Torques applied by a floating base      */
/*    generated with maple                 */
/*          Author: Kai Krieger            */
/*                  11.1.2012              */
/*******************************************/


#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrDynFloatingBase_sfun

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
    ssSetNumInputPorts(S, 8);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 7);  /* qd */
    ssSetInputPortWidth( S, 2, 1);  /* mass  */
    ssSetInputPortWidth( S, 3, 3);  /* position of COM of EE in TCP  */
    ssSetInputPortWidth( S, 4, 3);  /* main Axes Inertia of EE in TCP  */
    ssSetInputPortWidth( S, 5, 3);  /* translational base acceleration  */
    ssSetInputPortWidth( S, 6, 3);  /* rotational base velocity  */
    ssSetInputPortWidth( S, 7, 3);  /* rotational base acceleration
				       */

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 3, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 4, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 5, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 6, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 7, true); /*direct input signal access*/



    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 2, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 3, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 4, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 5, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 6, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 7, 1);   /* direct feedthrough flag*/



    /***********/
    /* OUTPUTS */
    /***********/
    ssSetNumOutputPorts( S, 1);   /* number of outputs */
    ssSetOutputPortWidth(S, 0, 7);  /* part from the floating base */


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
#define qd      ssGetInputPortRealSignal(S,1)
#define mass    ssGetInputPortRealSignal(S,2)[0]
#define rEE     ssGetInputPortRealSignal(S,3)
#define iEE     ssGetInputPortRealSignal(S,4)
#define a0      ssGetInputPortRealSignal(S,5)
#define omega_0 ssGetInputPortRealSignal(S,6)
#define alpha_0 ssGetInputPortRealSignal(S,7)

/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y       ssGetOutputPortRealSignal(S,0)

static void mdlOutputs(SimStruct *S, int tid)
{
  /* CALCULATE THE FLOATING TORQUE */
  lbrFloatingBaseTorquesDouble(q, qd, mass, iEE, rEE, a0, omega_0, alpha_0, y);
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
