/**********************************************/
/* EE Jacobian of the LBR3 with Floating Base */
/*    generated with maple                    */
/*          Author: Kai Krieger               */
/*                  18.8.2011                 */
/**********************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrJacobian_EE_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>


/* Calculation */
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
    ssSetNumOutputPorts( S, 1);   /* number of outputs */
    ssSetOutputPortMatrixDimensions(S, 0, 7, 6); /* 0_J_EE */



    ssSetNumSampleTimes(   S, 0);   /* number of sample times                */
    ssSetNumSFcnParams(    S, 0);   /* number of input arguments             */
    ssSetNumRWork(         S, 0);   /* number of real work vector elements   */
    ssSetNumIWork(         S, 0);   /* number of integer work vector elements*/
    ssSetNumPWork(         S, 0);   /* number of pointer work vector elements*/
}


static void mdlInitializeSampleTimes(SimStruct *S)
{;}


/*********************/
/* DEFINE INPUTS     */
/*********************/
#define q       ssGetInputPortRealSignal(S,0)
#define T7EE    ssGetInputPortRealSignal(S,1)


/*********************/
/* DEFINE OUTPUTS    */
/*********************/
#define y       ssGetOutputPortRealSignal(S,0)


static void mdlOutputs(SimStruct *S, int tid)
{
  int i,j;

  /* CALCULATE THE DYNAMICS */
  double Jac[7][6];
  lbrZeroJacobianEE_Double(q, T7EE, Jac);

  /*WRITE IT TO OUTPUT*/
  for (i=0; i<7; i++) {
    for (j=0; j<6; j++) {
      y[i+j*7] = Jac[i][j];
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
