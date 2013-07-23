# GCC 4.9 SaberMod Toolchain
USE_SABERMOD_ANDROIDEABI_49 := true

# build.prop property overrides common
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=3

# Enable ADB authentication
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

ifeq ($(HAVE_SELINUX),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

PRODUCT_PACKAGES += \
    SEAndroidAdmin \
    sepolicy \
    file_contexts \
    seapp_contexts \
    property_contexts \
    selinux-network.sh \
    mac_permissions.xml
endif

# Overlay common
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/common

# Superuser koush
SUPERUSER_EMBEDDED := true

# Disable c++11 mode
DEBUG_NO_STDCXX11 := yes

# Preload bootanimation zip into memory
TARGET_BOOTANIMATION_PRELOAD := true

# Bootanimation texture cache
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Extra packages
PRODUCT_PACKAGES += \
    Apollo \
    audio_effects.conf \
    bash \
    Basic \
    CMFileManager \
    com.tmobile.themes \
    DSPManager \
    e2fsck \
    mke2fs \
    tune2fs \
    htop \
    libcyanogen-dsp \
    libjackpal-androidterm4 \
    libssh \
    LockClock \
    nano \
    openvpn \
    powertop \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    Superuser \
    su \
    Term \
    vim \
    WallpaperZ

# sysinit support
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/bin/sysinit:system/bin/sysinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Busybox sync script
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/etc/init.d/99complete:system/etc/init.d/99complete

# Extra init file
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/etc/init.local.rc:root/init.sm.rc

# Allow fixing of permissions
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/bin/fix_permissions:system/bin/fix_permissions

# SaberMod banner
PRODUCT_COPY_FILES += \
   vendor/sm/prebuilts/common/system/etc/init.d/00banner:system/etc/init.d/00banner

# Inherit common build.prop overrides
-include vendor/sm/configs/common_versions.mk

# T-Mobile theme engine
-include vendor/sm/configs/themes_common.mk

# Rom Manager and Goomanager build.prop overrides
-include vendor/goomanager/goomanager-vendor.mk
-include vendor/RM/rm-vendor.mk

# video files and extra camera effects
-include frameworks/base/data/videos/VideoPackage2.mk
