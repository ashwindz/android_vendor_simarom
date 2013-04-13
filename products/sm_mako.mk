# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/lge/mako/full_mako.mk)

# Inherit SaberMod common gsm bits
$(call inherit-product, vendor/sm/configs/gsm.mk)

# Mako overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/mako

PRODUCT_NAME := sm_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.2.2/JDQ39/573038:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.2.2 JDQ39 573038 release-keys"

# Extra packages specific to Mako
PRODUCT_PACKAGES += \
    GalleryGoogleMako \
    Torch

# APN list
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/media/bootanimation.zip:system/media/bootanimation.zip

# Kernel modules
ifeq ($(USING_BUILD_SCRIPTS),true)
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    vendor/sm/prebuilts/mako/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko
endif
