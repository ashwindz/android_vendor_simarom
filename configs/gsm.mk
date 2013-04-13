# Extra Required SaberMod packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Mms \
    rild \
    Stk

# Extra gsm properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false
