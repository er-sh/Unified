/************************+++++++++++++*******************/
/* Joint Transformations of the LBR3 with Floating Base */
/*    generated with maple                              */
/*          Author: Kai Krieger                         */
/*                  18.8.2011                           */
/********************************************************/

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME lbrTransformations_sfun

#include "tmwtypes.h"
#include "simstruc.h"
#include <math.h>
#include <stdio.h>

/* Trafo calculations */
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
    ssSetOutputPortMatrixDimensions(S, 0, 4, 4); /* B_T_1 */
    ssSetOutputPortMatrixDimensions(S, 1, 4, 4); /* B_T_2 */
    ssSetOutputPortMatrixDimensions(S, 2, 4, 4); /* B_T_3 */
    ssSetOutputPortMatrixDimensions(S, 3, 4, 4); /* B_T_4 */
    ssSetOutputPortMatrixDimensions(S, 4, 4, 4); /* B_T_5 */
    ssSetOutputPortMatrixDimensions(S, 5, 4, 4); /* B_T_6 */
    ssSetOutputPortMatrixDimensions(S, 6, 4, 4); /* B_T_7 */
    ssSetOutputPortMatrixDimensions(S, 7, 4, 4); /* B_T_EE */


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
#define T1      ssGetOutputPortRealSignal(S,0)
#define T2      ssGetOutputPortRealSignal(S,1)
#define T3      ssGetOutputPortRealSignal(S,2)
#define T4      ssGetOutputPortRealSignal(S,3)
#define T5      ssGetOutputPortRealSignal(S,4)
#define T6      ssGetOutputPortRealSignal(S,5)
#define T7      ssGetOutputPortRealSignal(S,6)
#define TEE     ssGetOutputPortRealSignal(S,7)


static void mdlOutputs(SimStruct *S, int tid)
{
  int i,j;


  /* CALCULATE THE DYNAMICS */
  double allTrafos[4][32];
  lbrTransformationsDouble(q, T7EE, allTrafos);

  /*WRITE IT TO OUTPUT*/
  for (i=0; i<4; i++) {
    for (j=0; j<4; j++) {
      T1[i+j*4]  = allTrafos[i][j];
      T2[i+j*4]  = allTrafos[i][j+4];
      T3[i+j*4]  = allTrafos[i][j+8];
      T4[i+j*4]  = allTrafos[i][j+12];
      T5[i+j*4]  = allTrafos[i][j+16];
      T6[i+j*4]  = allTrafos[i][j+20];
      T7[i+j*4]  = allTrafos[i][j+24];
      TEE[i+j*4] = allTrafos[i][j+28];
    }
  }
}

#undef MDL_UPDATE
#undef MDL_DERIVATIVES


static void mdlTerminate(SimStruct *S)
{
  ;
}

#ifdef	MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
