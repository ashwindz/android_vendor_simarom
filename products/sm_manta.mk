# Inherit AOSP device configuration for manta.
$(call inherit-product, device/samsung/manta/full_manta.mk)

# Inherit SaberMod common_tablet bits
$(call inherit-product, vendor/sm/configs/common_tablet.mk)

# Inherit SaberMod manta overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/manta

# Discard inherited values and use our own instead.
PRODUCT_NAME := sm_manta
PRODUCT_DEVICE := manta
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mantaray BUILD_FINGERPRINT=google/mantaray/manta:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="mantaray-user 4.2.2 JDQ39 573038 release-keys"

# Extra packages specific to Manta
PRODUCT_PACKAGES += \
    GalleryGoogle-manta \
    VideoEditorGoogle-manta

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/manta/system/media/bootanimation.zip:system/media/bootanimation.zip

#Prebuilt libs
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/manta/system/lib/libjni_eglfence.so:system/lib/libjni_eglfence.so \
    vendor/sm/prebuilts/manta/system/lib/libjni_filtershow_filters.so:system/lib/libjni_filtershow_filters.so \
    vendor/sm/prebuilts/manta/system/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    vendor/sm/prebuilts/manta/system/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    vendor/sm/prebuilts/manta/system/lib/libvideoeditor_core.so:system/lib/libvideoeditor_core.so \
    vendor/sm/prebuilts/manta/system/lib/libvideoeditor_jni.so:system/lib/libvideoeditor_jni.so \
    vendor/sm/prebuilts/manta/system/lib/libvideoeditor_osal.so:system/lib/libvideoeditor_osal.so \
    vendor/sm/prebuilts/manta/system/lib/libvideoeditorplayer.so:system/lib/libvideoeditorplayer.so \
    vendor/sm/prebuilts/manta/system/lib/libvideoeditor_videofilters.so:system/lib/libvideoeditor_videofilters.so \
    vendor/sm/prebuilts/manta/system/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so

# extra manta init.d scripts
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/manta/system/etc/init.d/01gallery:system/etc/init.d/01gallery

# remount scripts for system
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/manta/system/etc/mount-rw:system/etc/mount-rw \
    vendor/sm/prebuilts/manta/system/etc/mount-ro:system/etc/mount-ro

ifeq ($(USING_BUILD_SCRIPTS),true)
# kernel modules
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/manta/system/lib/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    vendor/sm/prebuilts/manta/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko \
    vendor/sm/prebuilts/manta/system/lib/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    vendor/sm/prebuilts/manta/system/lib/modules/hid-logitech-dj.ko:system/lib/modules/hid-logitech-dj.ko \
    vendor/sm/prebuilts/manta/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko
endif

# manta audio
-include frameworks/base/data/sounds/AudioPackage9.mk
