/***********************++++++********************/
/* Reaction fores of the LBR3 with Floating Base */
/*    generated with maple                       */
/*          Author: Kai Krieger                  */
/*                  18.8.2011                    */
/******************************************++++++*/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrDynReaction_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>

/* Reaction calculation */
#include "LWR_IIIdyn.h"

static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumContStates(    S, 0);   /* number of continuous states           */
    ssSetNumDiscStates(    S, 0);   /* number of discrete states             */

    /**********/
    /* INPUTS */
    /**********/
    ssSetNumInputPorts(S, 10);   /* number of inputs */
    ssSetInputPortWidth( S, 0, 7);  /* q */
    ssSetInputPortWidth( S, 1, 7);  /* qd */
    ssSetInputPortWidth( S, 2, 7);  /* qdd */
    ssSetInputPortWidth( S, 3, 1);  /* mass of EE*/
    ssSetInputPortWidth( S, 4, 3);  /* Center of mass of EE*/
    ssSetInputPortWidth( S, 5, 3);  /* Inertia of EE*/
    ssSetInputPortWidth( S, 6, 3);  /* gravitational acceleration  */
    ssSetInputPortWidth( S, 7, 3);  /* translational base acceleration  */
    ssSetInputPortWidth( S, 8, 3);  /* rotational base velocity  */
    ssSetInputPortWidth( S, 9, 3);  /* rotational base acceleration*/

    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 3, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 4, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 5, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 6, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 7, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 8, true); /*direct input signal access*/
    ssSetInputPortRequiredContiguous(S, 9, true); /*direct input signal access*/
    
    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 1, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 2, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 3, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 4, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 5, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 6, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 7, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 8, 1);   /* direct feedthrough flag*/
    ssSetInputPortDirectFeedThrough(S, 9, 1);   /* direct feedthrough flag*/


    /***********/
    /* OUTPUTS */
    /***********/
    ssSetNumOutputPorts( S, 2);   /* number of outputs */
    ssSetOutputPortWidth(S, 0, 3);  /* Reaction Force */
    ssSetOutputPortWidth(S, 1, 3);  /* Reaction Momentum */


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
#define qdd     ssGetInputPortRealSignal(S,2)
#define mass    ssGetInputPortRealSignal(S,3)[0]
#define rEE     ssGetInputPortRealSignal(S,4)
#define iEE     ssGetInputPortRealSignal(S,5)
#define g       ssGetInputPortRealSignal(S,6)
#define a0      ssGetInputPortRealSignal(S,7)
#define omega0  ssGetInputPortRealSignal(S,8)
#define alpha0  ssGetInputPortRealSignal(S,9)


/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y1_out  ssGetOutputPortRealSignal(S,0)
#define y2_out  ssGetOutputPortRealSignal(S,1)


static void mdlOutputs(SimStruct *S, int tid)
{

  double F[][1] = {0,0,0,0,0,0};

  int i;

  /* CALCULATE THE DYNAMICS */
  lbrReactionsDouble(q, qd, qdd,
		     mass, rEE, iEE, g,
		     a0, omega0, alpha0, F);

  /* assign the outputs */

  for(i=0;i<3;i++) {
    y1_out[i]  = F[i][0];
    y2_out[i]  = F[i+3][0];
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
