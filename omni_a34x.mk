#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from a34x device
$(call inherit-product, device/samsung/a34x/device.mk)

PRODUCT_DEVICE := a34x
PRODUCT_NAME := omni_a34x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A346E
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a34xdxx-user 15 AP3A.240905.015.A2 A346EXXSEEZC7 release-keys"

BUILD_FINGERPRINT := samsung/a34xdxx/a34x:15/AP3A.240905.015.A2/A346EXXSEEZC7:user/release-keys
