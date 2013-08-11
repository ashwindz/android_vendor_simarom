# build.prop property overrides common
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enterprise_mode=1
    persist.sys.root_access=3

	# init.d support
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/etc/init.simarom.rc:root/init.simarom.rc
	
# Gesture enabled JNI
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so
 
	
# Enable ADB authentication
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0

ifeq ($(HAVE_SELINUX),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1
endif

# Overlay common
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/simarom/overlay/common

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
    audio_effects.conf \
    bash \
    Basic \
    e2fsck \
    mke2fs \
    tune2fs \
    htop \
    libssh \
    nano \
    openvpn \
    powertop \
    scp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    Superuser \
    su \
    Term 

# sysinit support
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/system/bin/sysinit:system/bin/sysinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/system/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Busybox sync script
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/system/etc/init.d/99complete:system/etc/init.d/99complete

# Allow fixing of permissions
PRODUCT_COPY_FILES += \
    vendor/simarom/prebuilts/common/system/bin/fix_permissions:system/bin/fix_permissions


# video files and extra camera effects
-include frameworks/base/data/videos/VideoPackage2.mk
