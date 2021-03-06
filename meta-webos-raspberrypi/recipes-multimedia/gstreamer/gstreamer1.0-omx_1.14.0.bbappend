# Copyright (c) 2018 LG Electronics, Inc.

EXTENDPRAUTO_append_rpi = "webosrpi2"

CPPFLAGS_append_rpi = " -I${STAGING_INCDIR}/IL \
    -I${STAGING_INCDIR}/interface/vcos/pthreads \
    -I${STAGING_INCDIR}/interface/vmcs_host/linux"

DEPENDS_append_rpi = " virtual/egl userland"

EXTRA_LDFLAGS_raspberrypi3 = "-lEGL -lbcm_host -lvcos -lvchiq_arm -lopenmaxil"
# raspberrypi3-64 version of userland doesn't provide bcm_host and openmaxil libraries
# (that's actually the only difference between set of files staged by userland build for raspberrypi3 and raspberrypi3-64)
EXTRA_LDFLAGS_raspberrypi3-64 = "-lEGL -lvcos -lvchiq_arm"
LDFLAGS_append_rpi = " ${EXTRA_LDFLAGS}"

GSTREAMER_1_0_OMX_CORE_NAME_rpi = "${libdir}/libopenmaxil.so"
GSTREAMER_1_0_OMX_TARGET_rpi = "rpi"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fix_adaptive_resolution_change_in_seek_issue.patch"
