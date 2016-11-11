cimport numpy as np

cdef extern from "LWR_IIIdyn.h":
     void lbrT0_1_Double (double* q, double* cgret)
     void lbrT0_2_Double (double* q, double* cgret)
     void lbrT0_3_Double (double* q, double* cgret)
     void lbrT0_4_Double (double* q, double* cgret)
     void lbrT0_5_Double (double* q, double* cgret)
     void lbrT0_6_Double (double* q, double* cgret)
     void lbrT0_7_Double (double* q, double* cgret)
#     void lbrT0_EE_Double (double* q, double* T7_EE, double* cgret)
     void lbrZeroJacobian1_Double(double *q, double* cgret)
     void lbrZeroJacobian2_Double(double *q, double* cgret)
     void lbrZeroJacobian3_Double(double *q, double* cgret)
     void lbrZeroJacobian4_Double(double *q, double* cgret)
     void lbrZeroJacobian5_Double(double *q, double* cgret)
     void lbrZeroJacobian6_Double(double *q, double* cgret)
     void lbrZeroJacobian7_Double(double *q, double* cgret)

     void lbrBodyJacobian1_Double(double *q, double* cgret)
     void lbrBodyJacobian2_Double(double *q, double* cgret)
     void lbrBodyJacobian3_Double(double *q, double* cgret)
     void lbrBodyJacobian4_Double(double *q, double* cgret)
     void lbrBodyJacobian5_Double(double *q, double* cgret)
     void lbrBodyJacobian6_Double(double *q, double* cgret)
     void lbrBodyJacobian7_Double(double *q, double* cgret)


def lbrT0_1(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_1_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_2(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_2_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_3(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_3_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_4(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_4_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_5(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_5_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_6(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_6_Double(<double*>q.data, <double*> cgret.data);
def lbrT0_7(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrT0_7_Double(<double*>q.data, <double*> cgret.data);

def lbr0JT1(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian1_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT2(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian2_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT3(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian3_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT4(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian4_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT5(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian5_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT6(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian6_Double(<double*>q.data, <double*> cgret.data);
def lbr0JT7(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrZeroJacobian7_Double(<double*>q.data, <double*> cgret.data);

def lbr1JT1(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian1_Double(<double*>q.data, <double*> cgret.data);
def lbr2JT2(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian2_Double(<double*>q.data, <double*> cgret.data);
def lbr3JT3(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian3_Double(<double*>q.data, <double*> cgret.data);
def lbr4JT4(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian4_Double(<double*>q.data, <double*> cgret.data);
def lbr5JT5(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian5_Double(<double*>q.data, <double*> cgret.data);
def lbr6JT6(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian6_Double(<double*>q.data, <double*> cgret.data);
def lbr7JT7(np.ndarray[np.double_t, ndim=1] q, np.ndarray[np.double_t, ndim=2] cgret):
    lbrBodyJacobian7_Double(<double*>q.data, <double*> cgret.data);
