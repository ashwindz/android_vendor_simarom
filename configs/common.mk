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
    ro.com.android.dataroaming=false \
    ro.ril.hsxpa=5 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=24 \
    ro.ril.hsupa.category=8 \
    debug.sf.hw=1 \
    debug.performance.tuning=1 \
    video.accelerate.hw=1 \
    windowsmgr.max_events_per_sec=360 \
    ro.max.fling_velocity=30000 \
    ro.min.fling_velocity=25000 \
    dalvik.vm.dexopt-flags=v=a,o=v,u=y,m=y \
    ro.HOME_APP_ADJ=1 \
    ro.min_pointer_dur=8 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.lockprof.threshold=850 \
    persist.sys.purgeable_assets=1 \
    ro.ril.power_collapse=1 \
    pm.sleep_mode=1 \
    wifi.supplicant_scan_interval=180 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    ro.config.nocheckin=1 \
    ro.ext4fs=1 \
    ro.config.hw_quickpoweron=true \
    persist.sys.use_dithering=0 \
    ro.telephony.call_ring.delay=0     

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
