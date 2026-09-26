#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Go variant: tuned for 1GB RAM (a2corelte)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Go heap profile (smaller zygote/app heaps)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Inherit from a2corelte device
$(call inherit-product, device/samsung/a2corelte/device.mk)

# Mini app set (go-appropriate)
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

# Low-RAM behavior: tighter process limits, reduced background caching
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=8

PRODUCT_LOCALES := en_US en_GB

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a2corelte
PRODUCT_NAME := lineage_go_a2corelte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

TARGET_VENDOR := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

TARGET_BOOT_ANIMATION_RES := 480
