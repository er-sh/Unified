#include "LWR_IIIdyn.h"


#ifndef RT
#ifdef __GNUC__
void coriolis (double q[7],
	       double qd[7],
	       double mEE,
	       double iEE[3],
	       double rEE[3],
	       double cgret[7])
{lbrCoriolisTorquesDouble(q, qd, mEE, iEE, rEE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void grav (double mEE,
	   double g[3],
	   double q[7],
	   double rEE[3],
	   double cgret[7]) 
{lbrGravitationalTorquesDouble(mEE, g, q, rEE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void mass (double q[7],
	   double mEE,
	   double rEE[3],
	   double iEE[3],
	   double cgret[7][7])
{lbrMassDouble(q, mEE, rEE, iEE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void reaction (double q[7],
	       double qd[7],
	       double qdd[7],
	       double mEE,
	       double rEE[3],
	       double iEE[3],
	       double g[3],
	       double a0[3],
	       double omega0[3],
	       double omegad0[3],
	       double cgret[6][1])
{lbrReactionsDouble(q, qd, qdd, mEE, rEE, iEE, g, a0, omega0, omegad0, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void floating (double q[7],
	       double qd[7],
	       double mEE,
	       double iEE[3],
	       double rEE[3],
	       double a0[3],
	       double omega0[3],
	       double omegad0[3],
	       double cgret[7])
{lbrFloatingBaseTorquesDouble(q, qd, mEE, iEE, rEE, a0, omega0, omegad0, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void transformations (double q[7],
		      double T7_EE[16],
		      double cgret[4][32]) 
{lbrTransformationsDouble(q, T7_EE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void T0_EE (double q[7],
	    double T7_EE[16],
	    double cgret[4][4])
{lbrT0_EE_Double(q, T7_EE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void jacobians (double q[7],
		double cgret[7][42])
{lbrZeroJacobiansDouble(q, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void JEE (double q[7],
	  double T7_EE[16],
	  double cgret[7][6])
{lbrZeroJacobianEE_Double(q, T7_EE, cgret);}
#endif
#endif


#ifndef RT
#ifdef __GNUC__
void jacobiansD (double q[7], 
		 double qd[7],
		 double cgret[7][42])
{lbrZeroJacobiansDotDouble(q, qd, cgret);}

#endif
#endif
