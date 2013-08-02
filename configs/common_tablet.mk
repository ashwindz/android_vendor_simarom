# Inherit common stuff
$(call inherit-product, vendor/simarom/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/simarom/overlay/tablet
