# Custom boot image for a2corelte (prebuilt kernel + dtb, Samsung footer)

ifdef TARGET_PREBUILT_DTB
    BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DTB)
endif

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) printf "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(BOOTIMAGE_EXTRA_DEPS)
	@echo ----- Making recovery image ------
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) printf "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
