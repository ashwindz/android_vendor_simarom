PRODUCT_PROPERTY_OVERRIDES += \
   persist.sys.themeId = ThyrusHoloBlack \
   persist.sys.themePackageName = com.template.theme.ThyrusHoloBlack

# Theme support
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/common/system/etc/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

PRODUCT_PACKAGES += \
    com.tmobile.themes \
    ThemeChooser \
    ThemeManager \
    THB
