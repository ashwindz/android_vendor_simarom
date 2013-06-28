USE_MORE_OPT_FLAGS := yes

# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/tilapia/full_tilapia.mk)

# Inherit SaberMod common_tablet bits
$(call inherit-product, vendor/sm/configs/common_tablet.mk)

# Inherit tilapia overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/tilapia

# Discard inherited values and use our own instead.
PRODUCT_NAME := sm_tilapia
PRODUCT_DEVICE := tilapia
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasig BUILD_FINGERPRINT="google/nakasig/tilapia:4.2.2/JDQ39/573038:user/release-keys" PRIVATE_BUILD_DESC="nakasig-user 4.2.2 JDQ39 573038 release-keys"

# <--- Tilapia device depends on Grouper -->

# Extra packages specific to Grouper
PRODUCT_PACKAGES += \
    GalleryGoogle-n7 \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

# Extra Required SaberMod packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

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

# Copy the APN list over
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/tilapia/system/etc/apns-conf.xml:system/etc/apns-conf.xml
