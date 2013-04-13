# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit SaberMod common_tablet bits
$(call inherit-product, vendor/sm/configs/common_tablet.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := sm_grouper
PRODUCT_DEVICE := grouper
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasi/grouper:4.2.2/JDQ39/405518:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.2.2 JDQ39 405518 release-keys"

# Extra packages specific to Grouper
PRODUCT_PACKAGES += \
    GalleryGoogle-n7

# Boot animations
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/grouper/system/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/sm/prebuilts/grouper/system/media/bootanimations/1.zip:system/media/bootanimations/1.zip \
    vendor/sm/prebuilts/grouper/system/etc/init.d/04bootanimations:system/etc/init.d/04bootanimations

# remount scripts for system
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/grouper/system/etc/mount-rw:system/etc/mount-rw \
    vendor/sm/prebuilts/grouper/system/etc/mount-ro:system/etc/mount-ro

ifeq ($(USING_BUILD_SCRIPTS),true)
# kernel modules
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/grouper/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko
endif
