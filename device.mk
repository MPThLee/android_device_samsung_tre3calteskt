#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/tre3calteskt

# Ramdisk
PRODUCT_PACKAGES += \
    init.baseband.rc \
    ueventd.universal5433.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/etc/mixer_paths_0.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/tre3calteskt/overlay	

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0 \
    libxml2 \
    libprotobuf-cpp-full \
    rild \
    libril \
    libsecril-client \
    libsecril-client-sap \
    Stk
	
# CPBoot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/cbd:$(TARGET_COPY_OUT_VENDOR)/bin/hw/cbd \
    $(LOCAL_PATH)/rootdir/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

PRODUCT_PACKAGES += \
    SamsungServiceMode

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Sensors wrapper
PRODUCT_PACKAGES += \
    sensors.universal5433

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml
	
# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-08-01	
	
# call the proprietary setup
$(call inherit-product, vendor/samsung/treltexx/treltexx-vendor.mk)
