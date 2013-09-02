#GCC
TARGET_GCC_VERSION_EXP := 4.7

# Inherit SaberMod common gsm bits
$(call inherit-product, vendor/simarom/configs/gsm.mk)

# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/lge/mako/aosp_mako.mk)

# Mako overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/simarom/overlay/mako

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/simarom/overlay/dictionaries
	
PRODUCT_NAME := simarom_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.3/JSS15Q/737497:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.3 JSS15Q 737497 release-keys"

# APN list
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/mako/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
ifeq ($(USING_BUILD_SCRIPTS),true)
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/mako/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    vendor/simarom/prebuilts/mako/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko
endif

# # remount scripts for system
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/mako/system/etc/mount-rw:system/etc/mount-rw \
    vendor/simarom/prebuilts/mako/system/etc/mount-ro:system/etc/mount-ro

# mako audio
-include frameworks/base/data/sounds/AudioPackage10.mk
