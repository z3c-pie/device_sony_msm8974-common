# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PLATFORM_PATH := device/sony/msm8974-common

# inherit hidl hals
$(call inherit-product, $(PLATFORM_PATH)/hidl.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_PATH)/overlay \
    $(PLATFORM_PATH)/overlay-lineage

ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(PLATFORM_PATH)/overlay-radio
    $(call inherit-product, $(PLATFORM_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(PLATFORM_PATH)/overlay-wifionly
endif

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Permissions
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rootdir/system/vendor/etc/permissions/permissions_sony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/permissions_sony.xml

# System properties
include $(LOCAL_PATH)/systemprop.mk

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessingdescriptors \
    libqcomvoiceprocessing \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Camera (stock blobs)
PRODUCT_PACKAGES += \
    camera.qcom \
    libshims_signal \
    libshims_idd \
    libsonycamera \
    libshim_camera \
    libshim_cald

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    memtrack.msm8974 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils

# GPS
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps_debug.conf \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PACKAGES += \
    libgps.utils \
    libgnss \
    libgnsspps\
    libloc_core \
    libloc_api_v02 \
    libloc_ds_api \
    liblocation_api

# Ion
PRODUCT_PACKAGES += \
    libion

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

#  Mobile Data
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libstagefrighthw

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml

# Recovery
PRODUCT_PACKAGES += \
    keycheck

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Snap Camera
PRODUCT_PACKAGES += \
    Snap

# Thermal management
PRODUCT_PACKAGES += \
    thermanager

# TimeKeep for managing time offsets w.r.t. RTC
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf
