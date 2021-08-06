#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/vs995/vs995-vendor.mk)

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

# Overlays (inherit after vendor/cm to ensure we override it)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# common v20
$(call inherit-product, device/lge/v20-common/v20.mk)

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/sensor_def_elsa_vzw_us.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_variable.conf

# WiFi Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/bcmdhd.cal:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/bcmdhd.cal

YOUR_HW_PLATFORM := msm8996

# Hardware
PRODUCT_BOARD_PLATFORM := $(YOUR_HW_PLATFORM)
PRODUCT_USES_QCOM_HARDWARE := true

# HALS
SRC_AUDIO_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/audio
SRC_DISPLAY_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/display
SRC_MEDIA_HAL_DIR := hardware/qcom-caf/$(YOUR_HW_PLATFORM)/media

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
$(LOCAL_PATH) \
hardware/qcom-caf/$(YOUR_HW_PLATFORM)