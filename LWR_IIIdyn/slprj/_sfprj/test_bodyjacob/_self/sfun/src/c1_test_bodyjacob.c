/* Include files */

#include "blascompat32.h"
#include "test_bodyjacob_sfun.h"
#include "c1_test_bodyjacob.h"
#include "mwmathutil.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "test_bodyjacob_sfun_debug_macros.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static const char * c1_debug_family_names[4] = { "nargin", "nargout", "u", "y" };

/* Function Declarations */
static void initialize_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void initialize_params_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance);
static void enable_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void disable_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void c1_update_debugger_state_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance);
static void set_sim_state_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_st);
static void finalize_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void sf_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void c1_chartstep_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void initSimStructsc1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);
static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber);
static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData);
static real_T c1_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_y, const char_T *c1_identifier);
static real_T c1_b_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static void c1_info_helper(c1_ResolvedFunctionInfo c1_info[14]);
static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static int32_T c1_c_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static uint8_T c1_d_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_test_bodyjacob, const char_T *
  c1_identifier);
static uint8_T c1_e_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_test_bodyjacobInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
  chartInstance->c1_sfEvent = CALL_EVENT;
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  chartInstance->c1_is_active_c1_test_bodyjacob = 0U;
}

static void initialize_params_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance)
{
}

static void enable_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void disable_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void c1_update_debugger_state_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_test_bodyjacob
  (SFc1_test_bodyjacobInstanceStruct *chartInstance)
{
  const mxArray *c1_st;
  const mxArray *c1_y = NULL;
  real_T c1_hoistedGlobal;
  real_T c1_u;
  const mxArray *c1_b_y = NULL;
  uint8_T c1_b_hoistedGlobal;
  uint8_T c1_b_u;
  const mxArray *c1_c_y = NULL;
  real_T *c1_d_y;
  c1_d_y = (real_T *)ssGetOutputPortSignal(chartInstance->S, 1);
  c1_st = NULL;
  c1_st = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_createcellarray(2));
  c1_hoistedGlobal = *c1_d_y;
  c1_u = c1_hoistedGlobal;
  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_create("y", &c1_u, 0, 0U, 0U, 0U, 0));
  sf_mex_setcell(c1_y, 0, c1_b_y);
  c1_b_hoistedGlobal = chartInstance->c1_is_active_c1_test_bodyjacob;
  c1_b_u = c1_b_hoistedGlobal;
  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", &c1_b_u, 3, 0U, 0U, 0U, 0));
  sf_mex_setcell(c1_y, 1, c1_c_y);
  sf_mex_assign(&c1_st, c1_y);
  return c1_st;
}

static void set_sim_state_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_st)
{
  const mxArray *c1_u;
  real_T *c1_y;
  c1_y = (real_T *)ssGetOutputPortSignal(chartInstance->S, 1);
  chartInstance->c1_doneDoubleBufferReInit = TRUE;
  c1_u = sf_mex_dup(c1_st);
  *c1_y = c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 0)),
    "y");
  chartInstance->c1_is_active_c1_test_bodyjacob = c1_d_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 1)),
     "is_active_c1_test_bodyjacob");
  sf_mex_destroy(&c1_u);
  c1_update_debugger_state_c1_test_bodyjacob(chartInstance);
  sf_mex_destroy(&c1_st);
}

static void finalize_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
}

static void sf_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
  int32_T c1_i0;
  real_T *c1_y;
  real_T (*c1_u)[42];
  c1_y = (real_T *)ssGetOutputPortSignal(chartInstance->S, 1);
  c1_u = (real_T (*)[42])ssGetInputPortSignal(chartInstance->S, 0);
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  for (c1_i0 = 0; c1_i0 < 42; c1_i0++) {
    _SFD_DATA_RANGE_CHECK((*c1_u)[c1_i0], 0U);
  }

  _SFD_DATA_RANGE_CHECK(*c1_y, 1U);
  chartInstance->c1_sfEvent = CALL_EVENT;
  c1_chartstep_c1_test_bodyjacob(chartInstance);
  sf_debug_check_for_state_inconsistency(_test_bodyjacobMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
}

static void c1_chartstep_c1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
  int32_T c1_i1;
  real_T c1_u[42];
  uint32_T c1_debug_family_var_map[4];
  real_T c1_nargin = 1.0;
  real_T c1_nargout = 1.0;
  real_T c1_y;
  int32_T c1_i2;
  real_T c1_x[42];
  real_T c1_k;
  real_T c1_b_k;
  real_T c1_b_x;
  real_T c1_b_y;
  real_T c1_c_y[42];
  int32_T c1_ix;
  int32_T c1_iy;
  int32_T c1_i;
  int32_T c1_a;
  int32_T c1_ixstart;
  real_T c1_mtmp;
  int32_T c1_itmp;
  int32_T c1_b_ix;
  real_T c1_c_x;
  boolean_T c1_b;
  boolean_T c1_searchingForNonNaN;
  int32_T c1_c_k;
  int32_T c1_d_k;
  int32_T c1_b_a;
  real_T c1_d_x;
  boolean_T c1_b_b;
  int32_T c1_c_a;
  int32_T c1_i3;
  int32_T c1_e_k;
  int32_T c1_d_a;
  real_T c1_b_mtmp;
  int32_T c1_e_a;
  real_T c1_maxval[6];
  int32_T c1_f_a;
  real_T c1_c_mtmp;
  int32_T c1_b_itmp;
  int32_T c1_c_ix;
  real_T c1_e_x;
  boolean_T c1_c_b;
  boolean_T c1_b_searchingForNonNaN;
  int32_T c1_f_k;
  int32_T c1_g_k;
  int32_T c1_g_a;
  real_T c1_f_x;
  boolean_T c1_d_b;
  int32_T c1_h_a;
  int32_T c1_i4;
  int32_T c1_d_ix;
  real_T c1_d_mtmp;
  real_T *c1_d_y;
  real_T (*c1_b_u)[42];
  boolean_T guard1 = FALSE;
  boolean_T guard2 = FALSE;
  boolean_T exitg1;
  boolean_T exitg2;
  c1_d_y = (real_T *)ssGetOutputPortSignal(chartInstance->S, 1);
  c1_b_u = (real_T (*)[42])ssGetInputPortSignal(chartInstance->S, 0);
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  for (c1_i1 = 0; c1_i1 < 42; c1_i1++) {
    c1_u[c1_i1] = (*c1_b_u)[c1_i1];
  }

  sf_debug_symbol_scope_push_eml(0U, 4U, 4U, c1_debug_family_names,
    c1_debug_family_var_map);
  sf_debug_symbol_scope_add_eml_importable(&c1_nargin, 0U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  sf_debug_symbol_scope_add_eml_importable(&c1_nargout, 1U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  sf_debug_symbol_scope_add_eml(c1_u, 2U, c1_b_sf_marshallOut);
  sf_debug_symbol_scope_add_eml_importable(&c1_y, 3U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 4);
  for (c1_i2 = 0; c1_i2 < 42; c1_i2++) {
    c1_x[c1_i2] = c1_u[c1_i2];
  }

  for (c1_k = 1.0; c1_k <= 42.0; c1_k++) {
    c1_b_k = c1_k;
    c1_b_x = c1_x[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
      c1_b_k), 1, 42, 1, 0) - 1];
    c1_b_y = muDoubleScalarAbs(c1_b_x);
    c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
      c1_b_k), 1, 42, 1, 0) - 1] = c1_b_y;
  }

  c1_ix = 0;
  c1_iy = 0;
  for (c1_i = 1; c1_i < 7; c1_i++) {
    c1_a = c1_ix + 1;
    c1_ix = c1_a;
    c1_ixstart = c1_ix;
    c1_mtmp = c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK
      ("", (real_T)c1_ixstart), 1, 42, 1, 0) - 1];
    c1_itmp = 2;
    c1_b_ix = c1_ixstart;
    c1_c_x = c1_mtmp;
    c1_b = muDoubleScalarIsNaN(c1_c_x);
    guard2 = FALSE;
    if (c1_b) {
      c1_searchingForNonNaN = TRUE;
      c1_c_k = 2;
      exitg2 = 0U;
      while ((exitg2 == 0U) && (c1_c_k < 8)) {
        c1_d_k = c1_c_k;
        c1_b_a = c1_b_ix + 1;
        c1_b_ix = c1_b_a;
        c1_d_x = c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
          _SFD_INTEGER_CHECK("", (real_T)c1_b_ix), 1, 42, 1, 0) - 1];
        c1_b_b = muDoubleScalarIsNaN(c1_d_x);
        if (!c1_b_b) {
          c1_mtmp = c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
            _SFD_INTEGER_CHECK("", (real_T)c1_b_ix), 1, 42, 1, 0) - 1];
          c1_itmp = c1_d_k + 1;
          c1_searchingForNonNaN = FALSE;
          exitg2 = 1U;
        } else {
          c1_c_k++;
        }
      }

      if (c1_searchingForNonNaN) {
      } else {
        guard2 = TRUE;
      }
    } else {
      guard2 = TRUE;
    }

    if (guard2 == TRUE) {
      c1_c_a = c1_itmp;
      c1_i3 = c1_c_a;
      for (c1_e_k = c1_i3; c1_e_k < 8; c1_e_k++) {
        c1_d_a = c1_b_ix + 1;
        c1_b_ix = c1_d_a;
        if (c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK(
              "", (real_T)c1_b_ix), 1, 42, 1, 0) - 1] > c1_mtmp) {
          c1_mtmp = c1_c_y[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
            _SFD_INTEGER_CHECK("", (real_T)c1_b_ix), 1, 42, 1, 0) - 1];
        }
      }
    }

    c1_b_mtmp = c1_mtmp;
    c1_e_a = c1_iy + 1;
    c1_iy = c1_e_a;
    c1_maxval[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
      (real_T)c1_iy), 1, 6, 1, 0) - 1] = c1_b_mtmp;
    _SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("", (real_T)
      c1_iy), 1, 6, 1, 0);
    c1_f_a = c1_ix + 6;
    c1_ix = c1_f_a;
  }

  c1_c_mtmp = c1_maxval[0];
  c1_b_itmp = 2;
  c1_c_ix = 1;
  c1_e_x = c1_c_mtmp;
  c1_c_b = muDoubleScalarIsNaN(c1_e_x);
  guard1 = FALSE;
  if (c1_c_b) {
    c1_b_searchingForNonNaN = TRUE;
    c1_f_k = 2;
    exitg1 = 0U;
    while ((exitg1 == 0U) && (c1_f_k < 7)) {
      c1_g_k = c1_f_k;
      c1_g_a = c1_c_ix + 1;
      c1_c_ix = c1_g_a;
      c1_f_x = c1_maxval[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
        _SFD_INTEGER_CHECK("", (real_T)c1_c_ix), 1, 6, 1, 0) - 1];
      c1_d_b = muDoubleScalarIsNaN(c1_f_x);
      if (!c1_d_b) {
        c1_c_mtmp = c1_maxval[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
          _SFD_INTEGER_CHECK("", (real_T)c1_c_ix), 1, 6, 1, 0) - 1];
        c1_b_itmp = c1_g_k + 1;
        c1_b_searchingForNonNaN = FALSE;
        exitg1 = 1U;
      } else {
        c1_f_k++;
      }
    }

    if (c1_b_searchingForNonNaN) {
    } else {
      guard1 = TRUE;
    }
  } else {
    guard1 = TRUE;
  }

  if (guard1 == TRUE) {
    c1_h_a = c1_b_itmp;
    c1_i4 = c1_h_a;
    for (c1_d_ix = c1_i4; c1_d_ix < 7; c1_d_ix++) {
      c1_c_ix = c1_d_ix;
      if (c1_maxval[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK(
            "", (real_T)c1_c_ix), 1, 6, 1, 0) - 1] > c1_c_mtmp) {
        c1_c_mtmp = c1_maxval[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)
          _SFD_INTEGER_CHECK("", (real_T)c1_c_ix), 1, 6, 1, 0) - 1];
      }
    }
  }

  c1_d_mtmp = c1_c_mtmp;
  c1_y = c1_d_mtmp;
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, -4);
  sf_debug_symbol_scope_pop();
  *c1_d_y = c1_y;
  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
}

static void initSimStructsc1_test_bodyjacob(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
}

static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber)
{
}

static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  real_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(real_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 0, 0U, 0U, 0U, 0));
  sf_mex_assign(&c1_mxArrayOutData, c1_y);
  return c1_mxArrayOutData;
}

static real_T c1_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_y, const char_T *c1_identifier)
{
  real_T c1_b_y;
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_b_y = c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_y), &c1_thisId);
  sf_mex_destroy(&c1_y);
  return c1_b_y;
}

static real_T c1_b_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  real_T c1_y;
  real_T c1_d0;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_d0, 1, 0, 0U, 0, 0U, 0);
  c1_y = c1_d0;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_y;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  real_T c1_b_y;
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)chartInstanceVoid;
  c1_y = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_b_y = c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_y), &c1_thisId);
  sf_mex_destroy(&c1_y);
  *(real_T *)c1_outData = c1_b_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_i5;
  int32_T c1_i6;
  int32_T c1_i7;
  real_T c1_b_inData[42];
  int32_T c1_i8;
  int32_T c1_i9;
  int32_T c1_i10;
  real_T c1_u[42];
  const mxArray *c1_y = NULL;
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_i5 = 0;
  for (c1_i6 = 0; c1_i6 < 6; c1_i6++) {
    for (c1_i7 = 0; c1_i7 < 7; c1_i7++) {
      c1_b_inData[c1_i7 + c1_i5] = (*(real_T (*)[42])c1_inData)[c1_i7 + c1_i5];
    }

    c1_i5 += 7;
  }

  c1_i8 = 0;
  for (c1_i9 = 0; c1_i9 < 6; c1_i9++) {
    for (c1_i10 = 0; c1_i10 < 7; c1_i10++) {
      c1_u[c1_i10 + c1_i8] = c1_b_inData[c1_i10 + c1_i8];
    }

    c1_i8 += 7;
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 0, 0U, 1U, 0U, 2, 7, 6));
  sf_mex_assign(&c1_mxArrayOutData, c1_y);
  return c1_mxArrayOutData;
}

const mxArray *sf_c1_test_bodyjacob_get_eml_resolved_functions_info(void)
{
  const mxArray *c1_nameCaptureInfo;
  c1_ResolvedFunctionInfo c1_info[14];
  const mxArray *c1_m0 = NULL;
  int32_T c1_i11;
  c1_ResolvedFunctionInfo *c1_r0;
  c1_nameCaptureInfo = NULL;
  c1_nameCaptureInfo = NULL;
  c1_info_helper(c1_info);
  sf_mex_assign(&c1_m0, sf_mex_createstruct("nameCaptureInfo", 1, 14));
  for (c1_i11 = 0; c1_i11 < 14; c1_i11++) {
    c1_r0 = &c1_info[c1_i11];
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->context, 15,
      0U, 0U, 0U, 2, 1, strlen(c1_r0->context)), "context", "nameCaptureInfo",
                    c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->name, 15, 0U,
      0U, 0U, 2, 1, strlen(c1_r0->name)), "name", "nameCaptureInfo", c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->dominantType,
      15, 0U, 0U, 0U, 2, 1, strlen(c1_r0->dominantType)), "dominantType",
                    "nameCaptureInfo", c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->resolved, 15,
      0U, 0U, 0U, 2, 1, strlen(c1_r0->resolved)), "resolved", "nameCaptureInfo",
                    c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->fileTimeLo,
      7, 0U, 0U, 0U, 0), "fileTimeLo", "nameCaptureInfo", c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->fileTimeHi,
      7, 0U, 0U, 0U, 0), "fileTimeHi", "nameCaptureInfo", c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->mFileTimeLo,
      7, 0U, 0U, 0U, 0), "mFileTimeLo", "nameCaptureInfo", c1_i11);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->mFileTimeHi,
      7, 0U, 0U, 0U, 0), "mFileTimeHi", "nameCaptureInfo", c1_i11);
  }

  sf_mex_assign(&c1_nameCaptureInfo, c1_m0);
  return c1_nameCaptureInfo;
}

static void c1_info_helper(c1_ResolvedFunctionInfo c1_info[14])
{
  c1_info[0].context = "";
  c1_info[0].name = "abs";
  c1_info[0].dominantType = "double";
  c1_info[0].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/abs.m";
  c1_info[0].fileTimeLo = 1286840294U;
  c1_info[0].fileTimeHi = 0U;
  c1_info[0].mFileTimeLo = 0U;
  c1_info[0].mFileTimeHi = 0U;
  c1_info[1].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/abs.m";
  c1_info[1].name = "eml_scalar_abs";
  c1_info[1].dominantType = "double";
  c1_info[1].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/eml_scalar_abs.m";
  c1_info[1].fileTimeLo = 1286840312U;
  c1_info[1].fileTimeHi = 0U;
  c1_info[1].mFileTimeLo = 0U;
  c1_info[1].mFileTimeHi = 0U;
  c1_info[2].context = "";
  c1_info[2].name = "max";
  c1_info[2].dominantType = "double";
  c1_info[2].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/max.m";
  c1_info[2].fileTimeLo = 1286840294U;
  c1_info[2].fileTimeHi = 0U;
  c1_info[2].mFileTimeLo = 0U;
  c1_info[2].mFileTimeHi = 0U;
  c1_info[3].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/max.m";
  c1_info[3].name = "eml_min_or_max";
  c1_info[3].dominantType = "char";
  c1_info[3].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[3].fileTimeLo = 1286840388U;
  c1_info[3].fileTimeHi = 0U;
  c1_info[3].mFileTimeLo = 0U;
  c1_info[3].mFileTimeHi = 0U;
  c1_info[4].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[4].name = "eml_const_nonsingleton_dim";
  c1_info[4].dominantType = "double";
  c1_info[4].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_const_nonsingleton_dim.m";
  c1_info[4].fileTimeLo = 1286840296U;
  c1_info[4].fileTimeHi = 0U;
  c1_info[4].mFileTimeLo = 0U;
  c1_info[4].mFileTimeHi = 0U;
  c1_info[5].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[5].name = "eml_scalar_eg";
  c1_info[5].dominantType = "double";
  c1_info[5].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalar_eg.m";
  c1_info[5].fileTimeLo = 1286840396U;
  c1_info[5].fileTimeHi = 0U;
  c1_info[5].mFileTimeLo = 0U;
  c1_info[5].mFileTimeHi = 0U;
  c1_info[6].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[6].name = "eml_index_class";
  c1_info[6].dominantType = "";
  c1_info[6].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  c1_info[6].fileTimeLo = 1286840378U;
  c1_info[6].fileTimeHi = 0U;
  c1_info[6].mFileTimeLo = 0U;
  c1_info[6].mFileTimeHi = 0U;
  c1_info[7].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[7].name = "eml_matrix_vstride";
  c1_info[7].dominantType = "double";
  c1_info[7].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_matrix_vstride.m";
  c1_info[7].fileTimeLo = 1286840388U;
  c1_info[7].fileTimeHi = 0U;
  c1_info[7].mFileTimeLo = 0U;
  c1_info[7].mFileTimeHi = 0U;
  c1_info[8].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_matrix_vstride.m";
  c1_info[8].name = "eml_index_minus";
  c1_info[8].dominantType = "double";
  c1_info[8].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_minus.m";
  c1_info[8].fileTimeLo = 1286840378U;
  c1_info[8].fileTimeHi = 0U;
  c1_info[8].mFileTimeLo = 0U;
  c1_info[8].mFileTimeHi = 0U;
  c1_info[9].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_matrix_vstride.m";
  c1_info[9].name = "eml_size_prod";
  c1_info[9].dominantType = "int32";
  c1_info[9].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_size_prod.m";
  c1_info[9].fileTimeLo = 1286840398U;
  c1_info[9].fileTimeHi = 0U;
  c1_info[9].mFileTimeLo = 0U;
  c1_info[9].mFileTimeHi = 0U;
  c1_info[10].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[10].name = "eml_index_times";
  c1_info[10].dominantType = "int32";
  c1_info[10].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m";
  c1_info[10].fileTimeLo = 1286840380U;
  c1_info[10].fileTimeHi = 0U;
  c1_info[10].mFileTimeLo = 0U;
  c1_info[10].mFileTimeHi = 0U;
  c1_info[11].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m";
  c1_info[11].name = "eml_matrix_npages";
  c1_info[11].dominantType = "double";
  c1_info[11].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_matrix_npages.m";
  c1_info[11].fileTimeLo = 1286840386U;
  c1_info[11].fileTimeHi = 0U;
  c1_info[11].mFileTimeLo = 0U;
  c1_info[11].mFileTimeHi = 0U;
  c1_info[12].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_matrix_npages.m";
  c1_info[12].name = "eml_index_plus";
  c1_info[12].dominantType = "double";
  c1_info[12].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m";
  c1_info[12].fileTimeLo = 1286840378U;
  c1_info[12].fileTimeHi = 0U;
  c1_info[12].mFileTimeLo = 0U;
  c1_info[12].mFileTimeHi = 0U;
  c1_info[13].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_min_or_max.m!eml_extremum_sub";
  c1_info[13].name = "isnan";
  c1_info[13].dominantType = "double";
  c1_info[13].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isnan.m";
  c1_info[13].fileTimeLo = 1286840360U;
  c1_info[13].fileTimeHi = 0U;
  c1_info[13].mFileTimeLo = 0U;
  c1_info[13].mFileTimeHi = 0U;
}

static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(int32_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 6, 0U, 0U, 0U, 0));
  sf_mex_assign(&c1_mxArrayOutData, c1_y);
  return c1_mxArrayOutData;
}

static int32_T c1_c_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  int32_T c1_y;
  int32_T c1_i12;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_i12, 1, 6, 0U, 0, 0U, 0);
  c1_y = c1_i12;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_b_sfEvent;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  int32_T c1_y;
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)chartInstanceVoid;
  c1_b_sfEvent = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_b_sfEvent),
    &c1_thisId);
  sf_mex_destroy(&c1_b_sfEvent);
  *(int32_T *)c1_outData = c1_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

static uint8_T c1_d_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_test_bodyjacob, const char_T *
  c1_identifier)
{
  uint8_T c1_y;
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_test_bodyjacob), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_test_bodyjacob);
  return c1_y;
}

static uint8_T c1_e_emlrt_marshallIn(SFc1_test_bodyjacobInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_y;
  uint8_T c1_u0;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_u0, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_u0;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_test_bodyjacobInstanceStruct
  *chartInstance)
{
}

/* SFunction Glue Code */
void sf_c1_test_bodyjacob_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3420139237U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2774052738U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(551072580U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1028871970U);
}

mxArray *sf_c1_test_bodyjacob_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,5,
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateDoubleMatrix(4,1,mxREAL);
    double *pr = mxGetPr(mxChecksum);
    pr[0] = (double)(1629813668U);
    pr[1] = (double)(1755902344U);
    pr[2] = (double)(447044677U);
    pr[3] = (double)(3388265895U);
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(7);
      pr[1] = (double)(6);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  return(mxAutoinheritanceInfo);
}

static const mxArray *sf_get_sim_state_info_c1_test_bodyjacob(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"y\",},{M[8],M[0],T\"is_active_c1_test_bodyjacob\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_test_bodyjacob_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc1_test_bodyjacobInstanceStruct *chartInstance;
    chartInstance = (SFc1_test_bodyjacobInstanceStruct *) ((ChartInfoStruct *)
      (ssGetUserData(S)))->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (_test_bodyjacobMachineNumber_,
           1,
           1,
           1,
           2,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           ssGetPath(S),
           (void *)S);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          init_script_number_translation(_test_bodyjacobMachineNumber_,
            chartInstance->chartNumber);
          sf_debug_set_chart_disable_implicit_casting
            (_test_bodyjacobMachineNumber_,chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(_test_bodyjacobMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"u");
          _SFD_SET_DATA_PROPS(1,2,0,1,"y");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,52);
        _SFD_TRANS_COV_WTS(0,0,0,1,0);
        if (chartAlreadyPresent==0) {
          _SFD_TRANS_COV_MAPS(0,
                              0,NULL,NULL,
                              0,NULL,NULL,
                              1,NULL,NULL,
                              0,NULL,NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 7;
          dimVector[1]= 6;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,2,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c1_b_sf_marshallOut,(MexInFcnForType)NULL);
        }

        _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c1_sf_marshallOut,(MexInFcnForType)c1_sf_marshallIn);

        {
          real_T *c1_y;
          real_T (*c1_u)[42];
          c1_y = (real_T *)ssGetOutputPortSignal(chartInstance->S, 1);
          c1_u = (real_T (*)[42])ssGetInputPortSignal(chartInstance->S, 0);
          _SFD_SET_DATA_VALUE_PTR(0U, *c1_u);
          _SFD_SET_DATA_VALUE_PTR(1U, c1_y);
        }
      }
    } else {
      sf_debug_reset_current_state_configuration(_test_bodyjacobMachineNumber_,
        chartInstance->chartNumber,chartInstance->instanceNumber);
    }
  }
}

static void sf_opaque_initialize_c1_test_bodyjacob(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc1_test_bodyjacobInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
    chartInstanceVar);
  initialize_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c1_test_bodyjacob(void *chartInstanceVar)
{
  enable_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c1_test_bodyjacob(void *chartInstanceVar)
{
  disable_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c1_test_bodyjacob(void *chartInstanceVar)
{
  sf_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*) chartInstanceVar);
}

extern const mxArray* sf_internal_get_sim_state_c1_test_bodyjacob(SimStruct* S)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_raw2high");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = (mxArray*) get_sim_state_c1_test_bodyjacob
    ((SFc1_test_bodyjacobInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c1_test_bodyjacob();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_raw2high'.\n");
  }

  return plhs[0];
}

extern void sf_internal_set_sim_state_c1_test_bodyjacob(SimStruct* S, const
  mxArray *st)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_high2raw");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = mxDuplicateArray(st);      /* high level simctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c1_test_bodyjacob();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_high2raw'.\n");
  }

  set_sim_state_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
    chartInfo->chartInstance, mxDuplicateArray(plhs[0]));
  mxDestroyArray(plhs[0]);
}

static const mxArray* sf_opaque_get_sim_state_c1_test_bodyjacob(SimStruct* S)
{
  return sf_internal_get_sim_state_c1_test_bodyjacob(S);
}

static void sf_opaque_set_sim_state_c1_test_bodyjacob(SimStruct* S, const
  mxArray *st)
{
  sf_internal_set_sim_state_c1_test_bodyjacob(S, st);
}

static void sf_opaque_terminate_c1_test_bodyjacob(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_test_bodyjacobInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
    }

    finalize_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
      chartInstanceVar);
    free((void *)chartInstanceVar);
    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_test_bodyjacob(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_test_bodyjacob((SFc1_test_bodyjacobInstanceStruct*)
      (((ChartInfoStruct *)ssGetUserData(S))->chartInstance));
  }
}

static void mdlSetWorkWidths_c1_test_bodyjacob(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(S,"test_bodyjacob","test_bodyjacob",1);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(S,"test_bodyjacob","test_bodyjacob",1,
                "RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop(S,"test_bodyjacob",
      "test_bodyjacob",1,"gatewayCannotBeInlinedMultipleTimes"));
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,"test_bodyjacob","test_bodyjacob",1,
        1);
      sf_mark_chart_reusable_outputs(S,"test_bodyjacob","test_bodyjacob",1,1);
    }

    sf_set_rtw_dwork_info(S,"test_bodyjacob","test_bodyjacob",1);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(4250589810U));
  ssSetChecksum1(S,(1793773134U));
  ssSetChecksum2(S,(3100798483U));
  ssSetChecksum3(S,(2355459153U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
}

static void mdlRTW_c1_test_bodyjacob(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    sf_write_symbol_mapping(S, "test_bodyjacob", "test_bodyjacob",1);
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c1_test_bodyjacob(SimStruct *S)
{
  SFc1_test_bodyjacobInstanceStruct *chartInstance;
  chartInstance = (SFc1_test_bodyjacobInstanceStruct *)malloc(sizeof
    (SFc1_test_bodyjacobInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc1_test_bodyjacobInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_test_bodyjacob;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_test_bodyjacob;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c1_test_bodyjacob;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_test_bodyjacob;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c1_test_bodyjacob;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_test_bodyjacob;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_test_bodyjacob;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_test_bodyjacob;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_test_bodyjacob;
  chartInstance->chartInfo.mdlStart = mdlStart_c1_test_bodyjacob;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c1_test_bodyjacob;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->S = S;
  ssSetUserData(S,(void *)(&(chartInstance->chartInfo)));/* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  sf_opaque_init_subchart_simstructs(chartInstance->chartInfo.chartInstance);
  chart_debug_initialization(S,1);
}

void c1_test_bodyjacob_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c1_test_bodyjacob(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_test_bodyjacob(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_test_bodyjacob(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_test_bodyjacob_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
