#ifndef LWR_IIIDYN_H
#define LWR_IIIDYN_H

#ifdef __cplusplus
extern "C" {
#endif

  /************************************************************/
  /* Coriolis Torques                                         */
  /************************************************************/

  /* This calculates the torque arising form the coriolsi effects that
     is  working on the robot
  q: joint positions
  qd: joint velocities
  mEE: additional mass arising from the end effector
  iEE: additional iniertia arising from the end effector
  rEE: Center of mass of the end effector given in the 7th frame of
  the robot.
  cgret: return by value of the coriolis torques */
  void lbrCoriolisTorquesDouble (double q[7],
				 double qd[7],
				 double mEE,
				 double iEE[3],
				 double rEE[3],
				 double cgret[7]);
  void lbrCoriolisTorquesFloat  (float q[7],
				 float qd[7],
				 float mEE,
				 float iEE[3],
				 float rEE[3],
				 float cgret[7]);

#ifdef __GNUC__
  void coriolis (double q[7],
		 double qd[7],
		 double mEE,
		 double iEE[3],
		 double rEE[3],
		 double cgret[7])  __attribute__ ((deprecated));
#endif

  /************************************************************/
  /* gravitational Torques                                    */
  /************************************************************/

  /* calculates the torques acting on the robot arisign from gravitiy
     mEE: Mass of the end effector
     q: Joint poisition
     rEE: position of the center of mass of the end effector given in
     the 7th frame.
     cgret: return of value of the torque */
  
  void lbrGravitationalTorquesDouble(double mEE,
				     double g[3],
				     double q[7],
				     double rEE[3],
				     double cgret[7]);
  void lbrGravitationalTorquesFloat(float mEE,
				    float g[3],
				    float q[7],
				    float rEE[3],
				    float cgret[7]);

#ifdef __GNUC__
  void grav (double mEE,
	     double g[3],
	     double q[7],
	     double rEE[3],
	     double cgret[7])  __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Mass Matrix                                               */
  /*************************************************************/

  /* calculates the actual mass amtrix of the robot
     q: joint positions
     rEE: position of the center of mass given in the 7th frame
     iEE: additional iniertia arising from the end effector
     cgret: return by value of the mass matrix */
   void lbrMassDouble(double q[7],
		     double mEE,
		     double rEE[3],
		     double iEE[3],
		     double cgret[7][7]);
  void lbrMassFloat(float q[7],
		    float mEE,
		    float rEE[3],
		    float iEE[3],
		    float cgret[7][7]);

#ifdef __GNUC__
  void mass (double q[7],
	     double mEE,
	     double rEE[3],
	     double iEE[3],
	     double cgret[7][7])  __attribute__ ((deprecated));
#endif

  /**************************************************************/
  /* Torques due to floating base                               */
  /**************************************************************/

  /* Torques applied to the robot due to an freely floating base
     q: joint positions
     qd: joint velocities
     mEE: mass of the end effector
     iEE: Inertia of the end effector w.r.t. the center of mass
     rEE: Center of mass with respect to the 7th body frame
     a0: translational accelerations applied to the robot base
     omega0: rotational velocites given in zero coordinates
     omegad0: rotaional accelerations given in zero coordinates
     cgret: return by value of the joint torques*/
  void lbrFloatingBaseTorquesDouble(double q[7],
				    double qd[7],
				    double mEE,
				    double iEE[3],
				    double rEE[3],
				    double a0[3],
				    double omega0[3],
				    double omegad0[3],
				    double cgret[7]);
  void lbrFloatingBaseTorquesFloat(float q[7],
				   float qd[7],
				   float mEE,
				   float iEE[3],
				   float rEE[3],
				   float a0[3],
				   float omega0[3],
				   float omegad0[3],
				   float cgret[7]);

#ifdef __GNUC__
  void floating (double q[7],
		 double qd[7],
		 double mEE,
		 double iEE[3],
		 double rEE[3],
		 double a0[3],
		 double omega0[3],
		 double omegad0[3],
		 double cgret[7])   __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Complete Dynamic floating base                            */
  /*************************************************************/

  /* Calculates the complete dynamic parts acting on an free floating robot.
     q: joint positions
     qd: joint velocities
     mEE: mass of the end effector
     iEE: Inertia of the end effector w.r.t. the center of mass
     rEE: Center of mass with respect to the 7th body frame
     g: gravitational vector in base coordinates
     a0: translational accelerations applied to the robot base
     omega0: rotational velocites given in zero coordinates
     omegad0: rotaional accelerations given in zero coordinates
     cgret[0][]: return by value of the joint torques due to coriolis forces
     cgret[1][]: return by value of the joint torques due to gravity
     cgret[2][]: return by value of the joint torques due to a
  floating base
     cgret[3-9][]: Mass Matrix */
  void lbrDynamicFloatingDouble(double q[7],
				double qd[7],
				double mEE,
				double rEE[3],
				double iEE[3],
				double g[3],
				double a0[3],
				double omega0[3],
				double omegad0[3],
				double cgret[7][10]);
  void lbrDynamicFloatingFloat(float q[7],
			       float qd[7],
			       float mEE,
			       float rEE[3],
			       float iEE[3],
			       float g[3],
			       float a0[3],
			       float omega0[3],
			       float omegad0[3],
			       float cgret[7][10]);


  /*************************************************************/
  /* Complete Dynamic static base                              */
  /*************************************************************/

  /* Calculates the complete dynamic parts acting on a fixed robot.
     q: joint positions
     qd: joint velocities
     mEE: mass of the end effector
     rEE: Center of mass with respect to the 7th body frame
     iEE: Inertia of the end effector w.r.t. the center of mass
     g: gravitational vector in base coordinates
     cgret[0][]: return by value of the joint torques due to coriolis forces
     cgret[1][]: return by value of the joint torques due to gravity
     cgret[2-8][]: Mass Matrix */

  void lbrDynamicDouble(double q[7],
			double qd[7],
			double mEE,
			double rEE[3],
			double iEE[3],
			double g[3],
			double cgret[7][9]);
  void lbrDynamicFloat(float q[7],
		       float qd[7],
		       float mEE,
		       float rEE[3],
		       float iEE[3],
		       float g[3],
		       float cgret[7][9]);
  

  /*************************************************************/
  /* Reaction Forces                                           */
  /*************************************************************/

  /* Reaction Forces which would act at the base frame given in the
     base frame:
     q: joint positions
     qd: joint velocities
     qdd: joint accelerations (M ^{-1}*(C+G+tau)
     mEE: mass of the end effector
     rEE: Center of mass with respect to the 7th body frame
     iEE: Inertia of the end effector w.r.t. the center of mass
     g: gravitational vector in base coordinates
     a0: translational accelerations applied to the robot base
     omega0: rotational velocites given in zero coordinates
     omegad0: rotaional accelerations given in zero coordinates
     cgret[0] Force Wrench */

  void lbrReactionsDouble(double q[7],
			  double qd[7],
			  double qdd[7],
			  double mEE,
			  double rEE[3],
			  double iEE[3],
			  double g[3],
			  double a0[3],
			  double omega0[3],
			  double omegad0[3],
			  double cgret[6][1]);
  void lbrReactionsFloat(float q[7],
			 float qd[7],
			 float qdd[7],
			 float mEE,
			 float rEE[3],
			 float iEE[3],
			 float g[3],
			 float a0[3],
			 float omega0[3],
			 float omegad0[3],
			 float cgret[6][1]);


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
		 double cgret[6][1])   __attribute__ ((deprecated));
#endif  




  /*************************************************************/
  /* Transformations                                           */
  /*************************************************************/

  /* Calculates the complete transformation matrices
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
  frame in column major
  cgret: Transformations */
  void lbrTransformationsDouble(double q[7],
				double T7_EE[16],
				double cgret[4][32]);
  void lbrTransformationsFloat(float q[7],
			       float T7_EE[16],
			       float cgret[4][32]);

#ifdef __GNUC__
  void transformations (double q[7],
			double T7_EE[16],
			double cgret[4][32])  __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Transformation to frame                                   */
  /*************************************************************/

  /* Transformation 0_T_x
     q: joint positions
     cgret: 0_T_x */
  void lbrT0_1_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_1_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_2_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_2_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_3_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_3_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_4_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_4_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_5_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_5_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_6_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_6_Float(float q[7],
		     float cgret[4][4]);
  void lbrT0_7_Double(double q[7],
		      double cgret[4][4]);
  void lbrT0_7_Float(float q[7],
		     float cgret[4][4]);
  
  /*************************************************************/
  /* Transformation Base Endeffector                           */
  /*************************************************************/

  /* Transformation 0_T_EE
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
            frame in column major
    cgret: 0_T_EE*/
  void lbrT0_EE_Double(double q[7],
		       double T7_EE[16],
		       double cgret[4][4]);
  void lbrT0_EE_Float(float q[7],
		      float T7_EE[16],
		      float cgret[4][4]);

#ifdef __GNUC__
  void T0_EE (double q[7],
	      double T7_EE[16],
	      double cgret[4][4])  __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Zero Jacobians                                            */
  /*************************************************************/

  /* calcuates all jacobians based in the base frame
     q: joint positions
     cgret: Jacobians (always[7x6] */
  void lbrZeroJacobiansDouble(double q[7],
			      double cgret[7][42]);
  void lbrZeroJacobiansFloat(float q[7],
			     float cgret[7][42]);

  /* calcuates all jacobians based in the base frame
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
     frame in column major
     cgret: Jacobians (always[7x6] */
  void lbrZeroJacobiansWithEEDouble(double q[7],
				    double T7_EE[16],
				    double cgret[7][48]);
  void lbrZeroJacobiansWithEEFloat(float q[7],
				   float T7_EE[16],
				   float cgret[7][48]);

#ifdef __GNUC__
  void jacobians (double q[7],
		   double cgret[7][42])  __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Zero Jacobians to x                                       */
  /*************************************************************/

  /* calculates the jacobian based in the base frame to frame x
     q: joint positions
     cgret: 0_J_x */
  void lbrZeroJacobian1_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian1_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian2_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian2_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian3_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian3_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian4_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian4_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian5_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian5_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian6_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian6_Float(float q[7],
			      float cgret[7][6]);
  void lbrZeroJacobian7_Double(double q[7],
			       double cgret[7][6]);
  void lbrZeroJacobian7_Float(float q[7],
			      float cgret[7][6]);
  
  /*************************************************************/
  /* Zero Jacobians to EE                                      */
  /*************************************************************/

  /* calculates the jacobian based in the base frame to the end
     effector frame
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
     frame in column major
     cgret: 0_J_EE */
  void lbrZeroJacobianEE_Double(double q[7],
				double T7_EE[16],
				double cgret[7][6]);
  void lbrZeroJacobianEE_Float(float q[7],
			       float T7_EE[16],
			       float cgret[7][6]);
#ifdef __GNUC__
  void JEE (double q[7],
	    double T7_EE[16],
	    double cgret[7][6])  __attribute__ ((deprecated));
#endif



  /*************************************************************/
  /* Zero Jacobians Time derivated                             */
  /*************************************************************/

  void lbrZeroJacobiansDotDouble(double q[7], 
				 double qd[7],
				 double cgret[7][42]);
  void lbrZeroJacobiansDotFloat(float q[7], 
				float qd[7],
				float cgret[7][42]);

#ifdef __GNUC__
  void jacobiansD (double q[7], 
		   double qd[7],
		   double cgret[7][42])  __attribute__ ((deprecated));
#endif

  /*************************************************************/
  /* Body Jacobians                                            */
  /*************************************************************/

  /* calcuates all jacobians based in the body frame
     q: joint positions
     cgret: Jacobians (always[7x6] */
  void lbrBodyJacobiansDouble(double q[7],
			      double cgret[7][42]);
  void lbrBodyJacobiansFloat(float q[7],
			     float cgret[7][42]);


  /* calcuates all jacobians based in the body frame
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
     frame in column major
     cgret: Jacobians (always[7x6] */
  void lbrBodyJacobiansWithEEDouble(double q[7],
				    double T7_EE[16],
				    double cgret[7][48]);
  void lbrBodyJacobiansWithEEFloat(float q[7],
				   float T7_EE[16],
				   float cgret[7][48]);

  /*************************************************************/
  /* Body Jacobians to x                                       */
  /*************************************************************/

  /* calculates the jacobian based in the base frame to frame x
     q: joint positions
     cgret: 0_J_x */
  void lbrBodyJacobian1_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian1_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian2_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian2_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian3_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian3_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian4_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian4_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian5_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian5_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian6_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian6_Float(float q[7],
			      float cgret[7][6]);
  void lbrBodyJacobian7_Double(double q[7],
			       double cgret[7][6]);
  void lbrBodyJacobian7_Float(float q[7],
			      float cgret[7][6]);
  
  /*************************************************************/
  /* Body Jacobians to EE                                      */
  /*************************************************************/

  /* calculates the jacobian based in the base frame to the end
     effector frame
     q: joint positions
     T7_EE: Transformation from the 7th body frame to the end effector
     frame in column major
     cgret: 0_J_EE */
  void lbrBodyJacobianEE_Double(double q[7],
				double T7_EE[16],
				double cgret[7][6]);
  void lbrBodyJacobianEE_Float(float q[7],
			       float T7_EE[16],
			       float cgret[7][6]);


#ifdef __cplusplus
}
#endif

#endif
