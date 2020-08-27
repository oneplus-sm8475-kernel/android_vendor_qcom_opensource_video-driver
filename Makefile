# SPDX-License-Identifier: GPL-2.0-only

# auto-detect subdirs

LINUXINCLUDE    += -I$(srctree)/techpack/video/include \
                   -I$(srctree)/techpack/video/include/uapi \
                   -I$(srctree)/techpack/video/include/uapi/vidc \
                   -I$(srctree)/techpack/video/driver/vidc/inc \
                   -I$(srctree)/techpack/video/driver/platform/waipio/inc \
                   -I$(srctree)/techpack/video/driver/variant/iris2/inc

USERINCLUDE     += -I$(srctree)/techpack/video/include/uapi

ccflags-y       += -I$(srctree)/techpack/video/driver/vidc/src/ \
                   -I$(srctree)/techpack/video/driver/platform/waipio/src/ \
                   -I$(srctree)/techpack/video/driver/variant/iris2/src

msm-vidc-objs   := driver/vidc/src/msm_vidc_v4l2.o \
                   driver/vidc/src/msm_vidc_vb2.o \
                   driver/vidc/src/msm_vidc.o \
                   driver/vidc/src/msm_vdec.o \
                   driver/vidc/src/msm_venc.o \
                   driver/vidc/src/msm_vidc_driver.o \
                   driver/vidc/src/msm_vidc_control.o \
                   driver/vidc/src/msm_vidc_buffer.o \
                   driver/vidc/src/msm_vidc_probe.o \
                   driver/vidc/src/msm_vidc_dt.o \
                   driver/vidc/src/msm_vidc_platform.o \
                   driver/vidc/src/msm_vidc_debug.o \
                   driver/vidc/src/msm_vidc_memory.o \
                   driver/vidc/src/venus_hfi.o \
                   driver/vidc/src/hfi_packet.o

ifneq ($(CONFIG_ARCH_QTI_VM), y)
ifeq ($(CONFIG_ARCH_LAHAINA), y)

include $(srctree)/techpack/video/config/waipio_video.conf
LINUXINCLUDE    += -include $(srctree)/techpack/video/config/waipio_video.h

msm-vidc-objs   += driver/platform/waipio/src/msm_vidc_waipio.o \
                   driver/variant/iris2/src/msm_vidc_iris2.o \
                   driver/variant/iris2/src/msm_vidc_buffer_iris2.o
endif
endif

obj-$(CONFIG_MSM_VIDC_V4L2) := msm-vidc.o
