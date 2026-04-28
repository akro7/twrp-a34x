#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/samsung/a34x

# ============================================
# Inheritance (المواريث الأساسية)
# ============================================
# وراثة إعدادات الـ AOSP الأساسية
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# وراثة إعدادات TWRP المشتركة (لو كنت بتبني بـ Minimal Manifest)
$(call inherit-product, vendor/twrp/config/common.mk)

# ============================================
# Dynamic Partitions & Virtual A/B
# ============================================
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_VIRTUAL_AB_DEVICE := true
PRODUCT_VIRTUAL_AB_COMPRESSION := true

# API Level - 12/تحديثه ليتناسب مع أندرويد 13/14
PRODUCT_SHIPPING_API_LEVEL := 32

# ============================================
# Health HAL (لإظهار نسبة الشحن والحرارة)
# ============================================
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# ============================================
# Fastbootd & Recovery Utilities
# ============================================
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    capmtk \
    update_engine \
    update_verifier \
    checkpoint_gc \
    otapreopt_script

# ============================================
# MediaTek & Samsung Features
# ============================================
# إضافة مكتبات التشفير لفك القفل عن الداتا
PRODUCT_PACKAGES += \
    plat_service_contexts \
    vendor_service_contexts

# إعدادات لغة الريكفري الافتراضية
PRODUCT_DEFAULT_LOCALE := en_US

# ============================================
# Logical Partitions (EROFS Support)
# ============================================
PRODUCT_FS_CONFIG_GEN := $(LOCAL_PATH)/config.fs
