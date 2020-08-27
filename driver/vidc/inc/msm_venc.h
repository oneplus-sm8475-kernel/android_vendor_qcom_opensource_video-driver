/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2020, The Linux Foundation. All rights reserved.
 */

#ifndef _MSM_VENC_H_
#define _MSM_VENC_H_

#include "msm_vidc_core.h"
#include "msm_vidc_inst.h"

int msm_venc_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
int msm_venc_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
int msm_venc_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f);
int msm_venc_inst_init(struct msm_vidc_inst *inst);

#endif // _MSM_VENC_H_