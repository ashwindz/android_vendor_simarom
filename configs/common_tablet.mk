# Inherit common stuff
$(call inherit-product, vendor/sm/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/tablet
