# Inherit AOSP device configuration for emulator.
$(call inherit-product, build/target/product/sdk.mk)

# Inherit common config files.
 $(call inherit-product, vendor/sm/configs/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := sm_emulator
PRODUCT_BRAND := Android
PRODUCT_DEVICE := generic
PRODUCT_MODEL := Emulator
PRODUCT_MANUFACTURER := google
