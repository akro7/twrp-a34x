#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a34x

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# ============================================
# Architecture (64-bit + 32-bit)
# ============================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# ============================================
# Bootloader
# ============================================
BOARD_VENDOR := samsung
TARGET_SOC := mt6877
TARGET_BOOTLOADER_BOARD_NAME := a34x
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := mt6877

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# ============================================
# Display
# ============================================
TW_THEME := portrait_hdpi
TARGET_SCREEN_DENSITY := 390
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080
TW_MAX_BRIGHTNESS := 1000
TW_DEFAULT_BRIGHTNESS := 300
TW_FRAMERATE := 90
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_BRIGHTNESS_PATH := /sys/devices/platform/panel_drv_0/backlight/panel/brightness
TARGET_USES_VULKAN := true
TW_NO_SCREEN_TIMEOUT := true

# ============================================
# Kernel
# ============================================
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 loop.max_part=7
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000

# Mkbootimg Args
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := a34x_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a34x

# Kernel - prebuilt logic
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO :=
endif

# ============================================
# Partitions
# ============================================
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Super Partition (Dynamic)
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext vendor_dlkm system_dlkm odm_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200

# System as root & Extra Folders
BOARD_ROOT_EXTRA_FOLDERS := carrier data_mirror debug_ramdisk efs linkerconfig metadata odm_dlkm oem optics postinstall prism second_stage_resources spu system_ext vendor_dlkm system_dlkm
BOARD_SUPPRESS_SECURE_ERASE := true

# ============================================
# Recovery & File Systems
# ============================================
BOARD_INCLUDE_RECOVERY_DTBO := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# ============================================
# Verified Boot (AVB)
# ============================================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# ============================================
# Crypto & Decryption (AKRO SECURE PROTOCOL)
# ============================================
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 14
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2

# ============================================
# Developer Features & Misc Tools
# ============================================
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LPTOOLS := true
TW_EXCLUDE_APEX := true
TW_NO_SCREEN_BLANK := true
RECOVERY_SDCARD_ON_DATA := true
TW_INPUT_BLACKLIST := hbtp_vm
TW_USE_TOOLBOX := true
TW_INCLUDE_TOOLBOX := true
TW_INCLUDE_BASH := true
TW_INCLUDE_NANO := true
TW_NO_BIND_SYSTEM := true
TW_EXTRA_LANGUAGES := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
PRODUCT_ENFORCE_VINTF_MANIFEST := true
TW_USE_LEGACY_BATTERY_SERVICES := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone36/temp

# Vendor Modules
TW_LOAD_VENDOR_MODULES := $(shell ls $(DEVICE_PATH)/recovery/root/lib/modules/*.ko 2> /dev/null | sed 's/.*\///')

# ============================================
# Samsung Specifics
# ============================================
TW_NO_REBOOT_BOOTLOADER := true
TW_USE_SAMSUNG_HAPTICS := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_FASTBOOTD := true

# ============================================
# Status Bar UI (AKRO Custom Layout)
# ============================================
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := 50
TW_CUSTOM_CLOCK_POS := 300
TW_CUSTOM_BATTERY_POS := 750

# ============================================
# Props
# ============================================
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_NO_LEGACY_PROPS := true

# ============================================
# Logging & USB
# ============================================
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_NEW_MINADBD := true
TW_HAS_MTP := true

# ============================================
# Versioning
# ============================================
TW_DEVICE_VERSION := AKRO-PRO-STABLE

# ============================================
# OrangeFox Specific Flags
# ============================================
FOX_BUILD_DEVICE := a34x
FOX_ARCH := arm64
OF_MAINTAINER := AKRO
OF_VERSION := 12.1
OF_USE_TWRP_SAR_DETECT := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_KEEP_DM_VERITY_FORCED_ENCRYPTION := 0
OF_FBE_METADATA_MOUNT_POINT := /metadata
OF_USE_MAGISKBOOT := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES := 1
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_PATCH_AVB20 := 1
FOX_RECOVERY_INSTALL_PARTITION := /dev/block/by-name/recovery
FOX_RECOVERY_BOOT_PARTITION := /dev/block/by-name/boot
